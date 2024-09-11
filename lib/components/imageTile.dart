import 'package:colorquizapp/constants/constants.dart';
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 1.0,
          ),
        ),
        child: Padding(padding: EdgeInsets.all(4), child: Column(
          children: [
            Expanded(
              child: Image.asset(imageUrl, fit: BoxFit.contain, width: 500, height: 1000,),
            ),
           Text(text, textAlign: TextAlign.center, style: AppConstants.heading4TextStyle,)
          ],
        ),)
      ),
    );
  }
}
