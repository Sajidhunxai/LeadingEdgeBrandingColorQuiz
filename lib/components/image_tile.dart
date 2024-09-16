import 'package:colorquizapp/constants/constants.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ImageTile({super.key, 
    required this.imageUrl,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Main content of the tile
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(text)
                ],
              ),
            ),
          ),
          // Dot indicator when selected
          if (isSelected)
            Positioned(
              top: 8, // Position at the top-right corner
              right: 8,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: AppConstants.primaryColor, // Color of the dot
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
