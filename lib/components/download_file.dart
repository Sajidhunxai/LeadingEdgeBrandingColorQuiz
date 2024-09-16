import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:typed_data';

class PDFScreen extends StatefulWidget {
  const PDFScreen({super.key});

  @override
  PDFScreenState createState() => PDFScreenState();
}

class PDFScreenState extends State<PDFScreen> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    preparePDF();
  }

  Future<void> preparePDF() async {
    final ByteData data = await rootBundle.load('assets/pdf/downloadfile.pdf');
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/downloadfile.pdf');
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 218, 234),
        title: Center(
          child: Image.asset('assets/images/logo.png',
              height: 50, fit: BoxFit.cover),
        ),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
