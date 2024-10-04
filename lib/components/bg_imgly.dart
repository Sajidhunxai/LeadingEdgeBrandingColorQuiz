import 'dart:io';

import 'package:colorquizapp/components/edit_image.dart';
import 'package:flutter/material.dart';

class BgImgly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PESDK & remove.bg')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              File imageFile = File('/path/to/your/image.jpg');
              editImage(context, imageFile);
            },
            child: Text('Edit Image'),
          ),
        ),
      ),
    );
  }
}