import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class DrawingArea extends StatelessWidget {
  final Uint8List? image;
  final Color selectedBackgroundColor;
  final double imageScale;
  final bool isDrawing;
  final List<Offset> points;
  final GlobalKey globalKey;

  const DrawingArea({
    Key? key,
    required this.image,
    required this.selectedBackgroundColor,
    required this.imageScale,
    required this.isDrawing,
    required this.points,
    required this.globalKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background container
          Container(
            width: double.infinity,
            height: double.infinity,
            color: selectedBackgroundColor,
          ),
          // Display resized image
          if (image != null)
            Transform.scale(
              scale: imageScale,
              child: Image.memory(image!),
            ),
          // Custom painter for drawing
          if (isDrawing)
            Positioned.fill(
              child: CustomPaint(
                painter: _DrawingPainter(points),
              ),
            ),
        ],
      ),
    );
  }
}

// Custom painter to draw brush strokes
class _DrawingPainter extends CustomPainter {
  final List<Offset> points;

  _DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
