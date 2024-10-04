import 'package:flutter/material.dart';

class ColorPickerComponent extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const ColorPickerComponent({
    Key? key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: colors.map((Color color) {
                  return GestureDetector(
                    onTap: () {
                      onColorSelected(color);
                      Navigator.pop(context); // Close the color picker after selection
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedColor == color ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.color_lens),
    );
  }
}
  