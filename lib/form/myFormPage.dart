import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  void _sendEmail(String name, String email) async {
    String username = dotenv.env['EMAIL']!;
    String password = dotenv.env['PASSWORD']!;
    // Configure the SMTP server using the provided server details
    final smtpServer = SmtpServer(
      'smtp.leadingedgebranding.com', // Ensure this is the correct SMTP server hostname
      port: 587, // Try port 587 for TLS
      username: username,
      password: password,
      ssl: false, // Set to false if using port 587
      ignoreBadCertificate:
          true, // Set to true if the server's certificate is self-signed or not recognized
    );

    final message = Message()
      ..from = Address(username,
          'color') // This should be an email allowed by the SMTP server
      ..recipients.add(dotenv.env['RECIPIENTEMAIL']!) // Send to this email
      ..subject = 'New Form Submission'
      ..text =
          'Name: $name\nEmail: $email\nCompany: ${_companyController.text}';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _companyController,
            decoration: const InputDecoration(
              labelText: 'Company/Organization',
            ),
          ),
          SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Send the email
                    _sendEmail(_nameController.text, _emailController.text);

                    // Navigate to the quiz page
                    Navigator.pushNamed(context, "/quiz");
                  }
                },
                child: Text('Click Here To Begin!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3F2684),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 100), // Padding
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
