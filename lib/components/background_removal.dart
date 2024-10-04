  import 'dart:typed_data';
  import 'dart:ui' as ui;
  import 'package:flutter/material.dart';
  import 'package:flutter/rendering.dart';
  import 'package:background_remover/background_remover.dart';
  import 'package:image_gallery_saver/image_gallery_saver.dart';
  import 'package:image_picker/image_picker.dart';
  import 'dart:io';
  import 'package:permission_handler/permission_handler.dart';
  import 'package:image_cropper/image_cropper.dart';
  import 'package:image/image.dart' as img; // Add this import

  class BackgroundRemoval extends StatefulWidget {
    const BackgroundRemoval({super.key, required this.title});
    final String title;

    @override
    State<BackgroundRemoval> createState() => _BackgroundRemovalState();
  }

  class _BackgroundRemovalState extends State<BackgroundRemoval> {
    Uint8List? image;
    bool isLoading = false;
    final GlobalKey _globalKey = GlobalKey();
    double _imageScale = 1.0; // Scale for resizing the image
    bool _isDrawing = false; // Flag to track drawing mode
    List<Offset> _points = []; // List to store points for drawing

    // List of available background colors
    List<Color> backgroundColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
    ];
    Color selectedBackgroundColor = Colors.red;

    Future<void> _pickImage() async {
      setState(() {
        image = null;
      });
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          isLoading = true;
        });
        final Uint8List imageBytes = await pickedFile.readAsBytes();

        image = await removeBackground(imageBytes: imageBytes);
        setState(() {
          isLoading = false;
        });
      }
    }

    Future<Uint8List?> _cropImage(Uint8List imageBytes) async {
      // Use the image_cropper package to crop the image
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageBytes.toString(), // Convert to file path
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
            ],
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      if (croppedFile != null) {
        // Load the cropped image as bytes
        return await File(croppedFile.path).readAsBytes();
      }
      return null;
    }

    Future<void> _cropImageAndUpdate() async {
      if (image == null) return;

      Uint8List? croppedImage = await _cropImage(image!);
      if (croppedImage != null) {
        setState(() {
          image = croppedImage; // Update the image with the cropped version
        });
      }
    }

    Future<void> _saveImage() async {
      try {
        RenderRepaintBoundary? boundary = _globalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary?;
        if (boundary == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error: Could not capture image.')),
          );
          return;
        }

        // Capture the widget as an image
        ui.Image captureImage = await boundary.toImage();
        ByteData? byteData =
            await captureImage.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // Request storage permission
        if (await Permission.storage.request().isGranted) {
          final result = await ImageGallerySaver.saveImage(pngBytes);
          if (result != null && result['isSuccess'] == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Image saved to gallery')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error saving image to gallery')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Permission denied. Cannot save image.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving image: $e')),
        );
      }
    }

    // Modal bottom sheet for color picker
    void _showColorPicker() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: backgroundColors.map((Color color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBackgroundColor = color;
                    });
                    Navigator.pop(
                        context); // Close the color picker after selection
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedBackgroundColor == color
                            ? Colors.transparent
                            : Colors.transparent,
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
    }

    // Toggle drawing mode
    void _toggleDrawing() {
      setState(() {
        _isDrawing = !_isDrawing;
        if (!_isDrawing)
          _points.clear(); // Clear points when exiting drawing mode
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (_isDrawing) {
                      setState(() {
                        RenderBox? renderBox =
                            context.findRenderObject() as RenderBox?;
                        _points.add(
                            renderBox!.globalToLocal(details.globalPosition));
                      });
                    }
                  },
                  onPanEnd: (details) {
                    if (_isDrawing) _points.add(Offset.zero); // End of the stroke
                  },
                  child: RepaintBoundary(
                    key: _globalKey,
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
                            scale: _imageScale,
                            child: Image.memory(image!),
                          ),
                        // Custom painter for drawing
                        if (_isDrawing)
                          Positioned.fill(
                            child: CustomPaint(
                              painter: _DrawingPainter(_points),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading) const LinearProgressIndicator(),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _pickImage,
              heroTag: 'pick_image',
              child: const Icon(Icons.image),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _showColorPicker,
              heroTag: 'pick_color',
              child: const Icon(Icons.color_lens),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _imageScale = _imageScale == 1.0
                      ? 1.5
                      : 1.0; // Toggle scale for image resize
                });
              },
              heroTag: 'resize_image',
              child: const Icon(Icons.zoom_out_map),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _toggleDrawing,
              heroTag: 'draw',
              child: Icon(_isDrawing ? Icons.brush : Icons.brush_outlined),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _cropImageAndUpdate, // Call the crop function here
              heroTag: 'crop',
              child: const Icon(Icons.crop),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _saveImage,
              heroTag: 'save',
              child: const Icon(Icons.save),
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
