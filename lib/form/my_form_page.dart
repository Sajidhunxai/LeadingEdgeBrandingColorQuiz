import 'package:colorquizapp/constants/constants.dart';
import 'package:colorquizapp/screens/main_quiz.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  MyFormPageState createState() => MyFormPageState();
}

class MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(border: Border.all(color: AppConstants.secondaryColor)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConstants
                        .secondaryColor, // Use dynamic value without const
                  ),
                ),
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConstants
                        .secondaryColor, // Use dynamic value without const
                  ),
                ),
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
            const SizedBox(height: 16),
            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConstants
                        .secondaryColor, // Use dynamic value without const
                  ),
                ),
                labelText: 'Company/Organization',
              ),
            ),
            const SizedBox(height: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    if (_formKey.currentState?.validate() ?? false)
                      {
                        // Navigate to the quiz page and pass the form data as arguments
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainQuiz(
                              name: _nameController.text,
                              email: _emailController.text,
                              company: _companyController.text,
                            ),
                          ),
                        )
                      },
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F2684),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 100), // Padding
                  ),
                  child: const Text('Click Here To Begin!'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
