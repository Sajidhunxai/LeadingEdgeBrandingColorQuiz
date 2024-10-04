import 'package:colorquizapp/components/background_removal.dart';
import 'package:colorquizapp/components/bg_imgly.dart';
import 'package:colorquizapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import 'constants/constants.dart';

void main() async {
  var logger = Logger();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    logger.e('Error loading .env file', e);
  }
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COLOR FOR WOMEN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppConstants.backgroundColor,
      ),
      home: BgImgly(),
      routes: {
        '/home': (context) => const HomeScreen(
              title: "Home Screen",
            ),
      },
    );
  }
}

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const BaseScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Image.asset('assets/images/logo.png',
                height: 120, fit: BoxFit.contain),
          ),
        ),
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
