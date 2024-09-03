
import 'package:colorquizapp/components/imageTile.dart';
import 'package:colorquizapp/main.dart';
import 'package:colorquizapp/quizData/quizAnswerData.dart';
import 'package:colorquizapp/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainQuiz extends StatefulWidget {
  @override
  _MainQuizState createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  int currentQuestionIndex = 0;
  int? selectedAnswerId;
  Map<int, MainAnswer> selectedAnswers = {}; // Map to store selected answers for each question

  void _onAnswerSelected(MainAnswer answer) {
    setState(() {
      selectedAnswerId = answer.id;

      // Store the selected answer for the current question index
      selectedAnswers[currentQuestionIndex] = answer;

      // Move to the next question or show the result
      int nextIndex = answer.nextQuestionIndex;
      if (nextIndex >= 0) {
        currentQuestionIndex = nextIndex;
        selectedAnswerId = null; // Reset selected answer for the new question
      } else {
        // Send quiz results via email
        sendQuizResults(selectedAnswers);

        // Navigate to the result screen when quiz is completed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              questions: questions,
              selectedAnswers: selectedAnswers,
              lastSelectedAnswer: answer,
            ),
          ),
        );
      }
    });
  }

  Future<void> sendQuizResults(Map<int, MainAnswer> selectedAnswers) async {
    String username = dotenv.env['EMAIL']!;
    String password = dotenv.env['PASSWORD']!;


    final smtpServer = SmtpServer(
        'leadingedgebranding.com',
        port: 465,
        username: username,
        password: password,
        ssl: true,
      );
    // Formatting the selected answers into a readable format
    String formattedAnswers = selectedAnswers.entries.map((entry) {
      int questionIndex = entry.key;
      MainAnswer answer = entry.value;
      return 'Question $questionIndex: ${answer.text}\n';
    }).join('\n');

    final message = Message()
      ..from = Address(username, 'Color Quiz App')
      ..recipients.add(dotenv.env['RECIPIENTEMAIL']!) 
      ..subject = 'Quiz Results'
      ..text = 'Here are the selected quiz answers:\n\n$formattedAnswers';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    return BaseScaffold(
      title: "",
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  currentQuestion.questionText,
                  style: const TextStyle(fontSize: 18),
                ),
                currentQuestion.questionImage != null
                    ? Image.asset(currentQuestion.questionImage!)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of tiles in each row
                childAspectRatio: 3 / 4, // Aspect ratio of the tiles
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(answer.moreInfo),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}