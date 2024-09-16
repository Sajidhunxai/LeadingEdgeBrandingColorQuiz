import 'package:colorquizapp/quizData/main_answer.dart';
import 'package:logger/logger.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> sendQuizResults(
    Map<int, MainAnswer> selectedAnswers, String name, String email, String company) async {
  
  String username = dotenv.env['EMAIL']!;
  String password = dotenv.env['PASSWORD']!;
  
  final smtpServer = SmtpServer(
    'smtp.leadingedgebranding.com',
    port: 587,
    username: username,
    password: password,
    ssl: false,
    ignoreBadCertificate: true,
  );

  // Format the quiz answers and form data
  String formattedAnswers = selectedAnswers.entries.map((entry) {
    int questionIndex = entry.key;
    MainAnswer answer = entry.value;
    return 'Question $questionIndex: ${answer.text}\n';
  }).join('\n');

  String messageBody = '''
Name: $name
Email: $email
Company: $company

Here are the selected quiz answers:
$formattedAnswers
  ''';
var logger =  Logger();
  final message = Message()
    ..from = Address(username, 'Color Quiz App')
    ..recipients.add(dotenv.env['RECIPIENTEMAIL']!)
    ..subject = 'Quiz Results'
    ..text = messageBody;

  try {
    final sendReport = await send(message, smtpServer);
    logger.e('Message sent: $sendReport');
  } on MailerException catch (e) {
    logger.e('Message not sent. \n${e.toString()}');
  }
}
