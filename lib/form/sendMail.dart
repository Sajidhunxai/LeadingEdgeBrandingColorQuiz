import 'package:colorquizapp/quizData/quizAnswerData.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> sendQuizResults(Map<int, MainAnswer> selectedAnswers) async {
    String username = dotenv.env['EMAIL']!;
    String password = dotenv.env['PASSWORD']!;

  final smtpServer = gmail(username, password);

  // Formatting the selected answers into a readable format
  String formattedAnswers = selectedAnswers.entries.map((entry) {
    int questionIndex = entry.key;
    MainAnswer answer = entry.value;
    return 'Question $questionIndex: ${answer.text}\n';
  }).join('\n');

  final message = Message()
    ..from = Address(username, 'Your App Name')
    ..recipients.add('recipient_email@example.com') // Replace with the recipient's email
    ..subject = 'Quiz Results'
    ..text = 'Here are the selected quiz answers:\n\n$formattedAnswers';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n${e.toString()}');
  }
}
