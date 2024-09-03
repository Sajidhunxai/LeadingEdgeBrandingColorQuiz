import 'package:flutter/material.dart';
import 'package:colorquizapp/components/imageTile.dart';

class Question extends StatelessWidget {
  final String questionText;
  final List<Map<String, dynamic>> answers;
  final int? selectedAnswerId;
  final ValueChanged<int> onAnswerSelected;

  const Question({
    Key? key,
    required this.questionText,
    required this.answers,
    required this.selectedAnswerId,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            questionText,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of tiles in each row
              childAspectRatio: 3 / 4, // Aspect ratio of the tiles
            ),
            itemCount: answers.length,
            itemBuilder: (context, index) {
              final answer = answers[index];
              return ImageTile(
                imageUrl: answer['image'],
                text: answer['text'],
                isSelected: selectedAnswerId == answer['id'],
                onTap: () {
                  onAnswerSelected(answer['id']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${answer['moreInfo']}"),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
