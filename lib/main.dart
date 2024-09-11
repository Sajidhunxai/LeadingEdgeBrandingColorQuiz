import 'dart:io';

import 'package:colorquizapp/screens/homeScreen.dart';
import 'package:colorquizapp/screens/mainQuiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  print('Current directory: ${Directory.current.path}');

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Error loading .env file: $e');
  }
    await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App with Global AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: "sd",),
      routes: {
        '/home': (context) => HomeScreen(title: "asd",),
        '/quiz': (context) => MainQuiz(),
      },
    );
  }
}

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  BaseScaffold({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Image.asset('assets/images/logo.png',
              height: 50, fit: BoxFit.cover),
        ),
      ),
      body: body,
    );
  }
}

