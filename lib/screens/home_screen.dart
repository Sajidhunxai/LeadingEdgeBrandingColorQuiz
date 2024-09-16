import 'package:colorquizapp/components/instruction.dart';
import 'package:colorquizapp/form/my_form_page.dart';
import 'package:colorquizapp/main.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: "Home Screen",
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                 Center(
                  child: Text("Digital Seasonal Color Analysis™",
                  selectionColor: AppConstants.primaryColor,
                      textAlign: TextAlign.center,
                      style: AppConstants.headingTextStyle),
                    
                ),
                 SizedBox(
                  height: 20,
                ),
                 InstructionsWidget(),
                
                MyFormPage(),
                  SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
