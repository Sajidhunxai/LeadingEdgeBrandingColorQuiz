import 'package:colorquizapp/main.dart';
import 'package:flutter/material.dart';
import 'package:colorquizapp/quizData/quizAnswerData.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, MainAnswer> selectedAnswers;
  final MainAnswer lastSelectedAnswer;

  ResultScreen({
    required this.questions,
    required this.selectedAnswers,
    required this.lastSelectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Your Leading Edge Seasonal Color Palette™",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6F42C1), // Replace with your color
                    fontSize: 32,
                  ),
                  textAlign: TextAlign
                      .center, // Optional, ensures text alignment within the container
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  lastSelectedAnswer.category,
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(
                        255, 72, 0, 1), // Replace with your color
                    fontSize: 32,
                  ),
                  textAlign: TextAlign
                      .center, // Optional, ensures text alignment within the container
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Divider
            Divider(
              thickness: 2,
              color: Color(0xFF660099), // Replace with your color
            ),
            SizedBox(height: 20),

            // Image
            Image.network(
              'https://mlgexgsh0aao.i.optimole.com/w:auto/h:auto/q:mauto/f:best/ig:avif/https://leadingedgebranding.com/wp-content/uploads/2023/02/4-Season-Logo-Combo-png.png',
              width: 322,
              height: 322,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            // Print/Save Reminder
            const Text(
              "Print or save this page to remember your",
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 22,
                color:
                    Color.fromRGBO(102, 102, 102, 1), // Replace with your color
              ),
              textAlign: TextAlign.center,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  " Leading Edge Seasonal Color Palette™ ",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(
                        255, 72, 0, 1), // Replace with your color
                    fontSize: 22,
                  ),
                  textAlign: TextAlign
                      .center, // Optional, ensures text alignment within the container
                ),
              ),
            ),
            const Text(
              "for your upcoming seminar, webinar, workshop, or coaching session where you will learn how to strategically position yourself for any business situation!",
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 22,
                color:
                    Color.fromRGBO(102, 102, 102, 1), // Replace with your color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Thank You Note
            Text(
              "We look forward to seeing you soon.",
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 22,
                color:
                    Color.fromRGBO(102, 102, 102, 1), // Replace with your color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Thank You Gift
            Text(
              "As a 'Thank You' for taking the assessment, we are offering you a complimentary copy of our",
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 22,
                color:
                    Color.fromRGBO(102, 102, 102, 1), // Replace with your color
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "\"20 Quick-Tips To Optimizing Your Virtual Presence\".",
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 22,
                color: Color.fromRGBO(255, 72, 0, 1), // Replace with your color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Download Button
            ElevatedButton(
              onPressed: () {
                // Handle button press
                final url =
                    'https://leadingedgebranding.com/wp-content/uploads/2021/09/20-Quick-Tips-Optimizing-Virtual-Presence-2021V1.pdf';
                // Open URL
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(255, 72, 0, 1), // Replace with your color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                "Get Your Complimentary Copy Here!",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            SizedBox(height: 20),

            // Divider
            Divider(
              thickness: 1,
              color: Color(0xFF660099), // Replace with your color
            ),
          ],
        ),
      ),
    );
  }
}
