import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  ImageTile({
    required this.imageUrl,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
