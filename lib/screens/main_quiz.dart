import 'package:colorquizapp/components/image_tile.dart';
import 'package:colorquizapp/constants/constants.dart';
import 'package:colorquizapp/main.dart';
import 'package:colorquizapp/quizData/main_answer.dart';
import 'package:colorquizapp/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainQuiz extends StatefulWidget {
  final String name;
  final String email;
  final String company;

  const MainQuiz({super.key, required this.name, required this.email, required this.company});

  @override
  MainQuizState createState() => MainQuizState();
}

class MainQuizState extends State<MainQuiz> {
  int currentQuestionIndex = 0;
  int? selectedAnswerId;
  Map<int, MainAnswer> selectedAnswers = {}; // Map to store selected answers

  void _onAnswerSelected(MainAnswer answer) {
    setState(() {
      selectedAnswerId = answer.id;

      // Store the selected answer for the current question index
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  void _onNextPressed() {
    setState(() {
      int nextIndex = selectedAnswers[currentQuestionIndex]?.nextQuestionIndex ?? -1;
      if (nextIndex >= 0) {
        currentQuestionIndex = nextIndex;
        selectedAnswerId = null; // Reset selected answer for the new question
      } else {
        // Send the quiz results via email
        sendQuizResults(
          selectedAnswers,
          widget.name,
          widget.email,
          widget.company,
        );

        // Navigate to the result screen when quiz is completed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              questions: questions,
              selectedAnswers: selectedAnswers,
              lastSelectedAnswer: selectedAnswers[currentQuestionIndex]!,
            ),
          ),
        );
      }
    });
  }

  Future<void> sendQuizResults(
      Map<int, MainAnswer> selectedAnswers,
      String name,
      String email,
      String company) async {
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

    // Formatting the selected answers into a readable format
    String formattedAnswers = selectedAnswers.entries.map((entry) {
      int questionIndex = entry.key;
      MainAnswer answer = entry.value;
      return 'Question $questionIndex: ${answer.text}\n';
    }).join('\n');

    // Merging form data and quiz answers
    final message = Message()
      ..from = Address(username, 'Color Quiz App')
      ..recipients.add(dotenv.env['RECIPIENTEMAIL']!)
      ..subject = 'Quiz Results from $name'
      ..text = 'Name: $name\nEmail: $email\nCompany: $company\n\n'
          'Here are the selected quiz answers:\n\n$formattedAnswers';

  var logger = Logger();
    try {
      final sendReport = await send(message, smtpServer);
      logger.e('Message sent: $sendReport');
    } on MailerException catch (e) {
      logger.e('Message not sent. \n${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    return BaseScaffold(
      title: "Quiz",
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    currentQuestion.questionText,
                    textAlign: TextAlign.center,
                    style: AppConstants.heading3TextStyle,
                  ),
                  currentQuestion.questionImage != null
                      ? Image.asset(currentQuestion.questionImage!)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of tiles in each row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: currentQuestion.answers.length,
                itemBuilder: (context, index) {
                  final answer = currentQuestion.answers[index];
                  return ImageTile(
                    imageUrl: answer.imageUrl,
                    text: answer.text,
                    isSelected: selectedAnswerId == answer.id,
                    onTap: () {
                      _onAnswerSelected(answer);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectedAnswerId != null ? _onNextPressed : null,
        backgroundColor:
            selectedAnswerId != null ? AppConstants.primaryColor : Colors.grey,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
