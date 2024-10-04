import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

Future<File?> removeBackground(File imageFile, String apiKey) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://api.remove.bg/v1.0/removebg'),
  );
  request.files.add(
    await http.MultipartFile.fromPath('image_file', imageFile.path),
  );
  request.headers['X-Api-Key'] = apiKey;

  final response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    final outputImage = File('${imageFile.path}_nobg.png');
    await outputImage.writeAsBytes(responseData.bodyBytes);
    return outputImage;
  } else {
    print('Error: ${response.statusCode}');
    return null;
  }
}

void editImage(BuildContext context, File imageFile) async {
  // Optionally, remove background first
  String apiKey = 'YOUR_REMOVE_BG_API_KEY';
  File? bgRemovedImage = await removeBackground(imageFile, apiKey);
  if (bgRemovedImage != null) {
    final result = await PESDK.openEditor(image: bgRemovedImage.path);
    if (result != null) {
      print('Image saved at: ${result}');
    }
  }
}