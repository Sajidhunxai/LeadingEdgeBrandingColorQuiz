import 'package:flutter/material.dart';

class FloatingActionButtons extends StatelessWidget {
  final Function() onPickImage;
  final Function() onColorPicker;
  final Function() onResizeImage;
  final Function() onToggleDrawing;
  final Function() onSaveImage;

  const FloatingActionButtons({
    Key? key,
    required this.onPickImage,
    required this.onColorPicker,
    required this.onResizeImage,
    required this.onToggleDrawing,
    required this.onSaveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: onPickImage,
          child: const Icon(Icons.image),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: onColorPicker,
          child: const Icon(Icons.color_lens),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: onResizeImage,
          child: const Icon(Icons.zoom_out_map),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: onToggleDrawing,
          child: const Icon(Icons.brush),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: onSaveImage,
          child: const Icon(Icons.save),
        ),
      ],
    );
  }
}
