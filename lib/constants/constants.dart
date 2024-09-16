import 'package:flutter/material.dart';

class AppConstants {
  // Application-wide constants
  static const String appName = 'LeadingEdgeBranding Color Quiz';
  static const String apiUrl = 'https://api.leadingedgebranding.com';
  static const String defaultLanguage = 'en';

  // UI constants
  static const double defaultPadding = 16.0;
  static const double cardElevation = 4.0;

  // Color constants
  static const Color primaryColor = Color(0xFFff4600);
  static const Color secondaryColor = Color(0xFF660099);
  static const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color textColor = Color.fromARGB(255, 0, 0, 0);

  // TextStyle constants
  static const TextStyle headingTextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  static const TextStyle heading2TextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  static const TextStyle heading3TextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  static const TextStyle heading4TextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  static const TextStyle paragraphTextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textColor,
  );
  static const TextStyle paragraphBoldTextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

}
