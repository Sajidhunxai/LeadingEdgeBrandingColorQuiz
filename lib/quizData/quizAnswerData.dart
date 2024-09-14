import 'package:flutter/material.dart';

class MainAnswer {
  final int id;
  final String imageUrl;
  final String text;
  final String moreInfo;
  final String category;
  final int nextQuestionIndex;

  MainAnswer({
    required this.id,
    required this.imageUrl,
    required this.text,
    required this.moreInfo,
    this.category = "",
    required this.nextQuestionIndex,
  });
}

class Question {
  final String questionText;
  final questionImage;
  final List<MainAnswer> answers;

  Question({
    this.questionImage,
    required this.questionText,
    required this.answers,
  });
}

const category = ["Autumn", "Spring", "Winter", "Summer"];

final List<Question> questions = [
  //Question 1 index 0
  Question(
    questionText: 'Which of the following describes your hair color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/hair/3AshGray.png',
        text: 'Ash',
        moreInfo: 'This hair color is often referred to as "mousy" gray.',
        nextQuestionIndex: 1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/hair/1.Black2025.png',
        text: 'Black',
        moreInfo: 'This hair color is often referred to as "mousy" gray.',
        nextQuestionIndex: 1, // Points to the next question
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/hair/3.SaltandPepper2025.png',
        text: 'Salt & Pepper',
        moreInfo: 'This hair color has black hair, mixed with white or silver.',
        nextQuestionIndex: 1,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/hair/6.White2025.png',
        text: 'Steely White',
        moreInfo:
            'Make sure that you do not have any presence of yellowish or gold tones in this category. If you do, DO NOT select this one!',
        nextQuestionIndex: 1,
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'I do not have gray hair',
        moreInfo: '',
        nextQuestionIndex: 2, // This leads to a different question
      ),
    ],
  ),

  // Option 2 Summer Eyes q1v1 index 1
  Question(
    questionText: 'Which color best describes your eye color?',
    answers: [
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/roseBrown.jpg',
        text: 'Rose Brown',
        category: category[3],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/blueGray.png',
        text: 'Gray Blue',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/gray.jpg',
        text: 'gray',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/grayGreen.jpg',
        text: 'Gray Green',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
    ],
  ),
  //option 1  Winter Eyes q1v2 index 2
  Question(
    questionText: 'Which color best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/black.jpg',
        text: 'black',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/brownBlack.jpg',
        text: 'Brown Black',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/brownRed.jpg',
        text: 'Brown Red',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/sapphireBlue.jpg',
        text: 'Sapphire',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ), // This leads to a different question
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/eyes/emeraldGreen.jpg',
        text: 'Emerald',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/eyes/violet.jpg',
        text: 'Violet',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ),
    ],
  ),

  // Option 3  No yes option Question 2 index 3
  Question(
    questionText: 'Do You have dark hair, dark eyes and dark skin color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/icons/tick.png',
        text: 'Yes',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 4,
      ),
    ],
  ),
  // Option 4 Question 3 index 4
  Question(
    questionText: 'Do You have lighter hair, eyes and skin color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/icons/tick.png',
        text: 'Yes',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 6,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 5,
      ),
    ],
  ),
  //option 5 question 5 spring and summer index 5
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/lightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/lightOlive.jpg',
        text: 'Light Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/clearGreen.jpg',
        text: 'Clear Green',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/clearBlue.jpg',
        text: 'Clear Blue',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/eyes/aqua.jpg',
        text: 'Aqua',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/eyes/roseBrown.jpg',
        text: 'Rose Brown',
        category: category[3],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/eyes/grayGreen.jpg',
        text: 'Gray Green',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/gray.jpg',
        text: 'gray',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/blueGray.png',
        text: 'Gray Blue',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // This leads to a different question
      ),
    ],
  ),
  // Option 6 Question 4 index 6
  Question(
    questionText:
        'Do you have strawberry  blonde, copper, or auburn  hair color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/icons/tick.png',
        text: 'Yes',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 8,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 7,
      ),
    ],
  ),
  //option 7  Question 5 index 7
  Question(
    questionText:
        'What color best describes  how light or dark your hair  color is?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/icons/tick.png',
        text: 'Yes',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 2,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 5,
      ),
    ],
  ),
  //option 8 quesntion 4 index 8
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/lightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/lightOlive.jpg',
        text: 'Light Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/clearGreen.jpg',
        text: 'Clear Green',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/clearBlue.jpg',
        text: 'Clear Blue',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/eyes/aqua.jpg',
        text: 'Aqua',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/eyes/goldenBrown.png',
        text: 'Golden Brown',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 10,
        imageUrl: 'assets/images/eyes/turquoise.jpg',
        text: 'Turquoise',
        category: category[0],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
    ],
  ),
  //question 5 answer index 9
  Question(
    questionText: 'Which best describes how light or dark your hair color is?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/hair/1.Black2025.png',
        text: 'Black',
        moreInfo: '',
        nextQuestionIndex: 9, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/hair/2.DarkestBrownCircle.png',
        text: 'Darkest Brown',
        moreInfo: '',
        nextQuestionIndex: 9,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/hair/3.DarkBrownCircle.png',
        text: 'Dark Brown',
        moreInfo: '',
        nextQuestionIndex: 9, // Points to the next question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/hair/4.MediumBrown.png',
        text: 'Medium Brown',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/hair/5.LightBrownCircle.png',
        text: 'Light Brown',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/hair/6.DarkBlondeCircle.png',
        text: 'Dark Blonde',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/hair/7.MediumBlondeCircle.png',
        text: 'Medium Blonde',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/hair/8.BlondeCircle.png',
        text: 'Blonde',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/hair/10.-Light-Blonde.png',
        text: 'Light Blonde',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
      MainAnswer(
        id: 10,
        imageUrl: 'assets/images/hair/10.LightestBlondeCircle.png',
        text: 'Lightest Blonde',
        moreInfo: '',
        nextQuestionIndex: 8, // This leads to a different question
      ),
    ],
  ),
  //question 5v1 answer index 10 5-6 int
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
       MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/goldenBrown.png',
        text: 'Golden Brown',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/eyes/turquoise.jpg',
        text: 'Turquoise',
        category: category[0],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
    ],
  ),
  //question 5v1 answer index 11 7-10 int
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
       MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/goldenBrown.png',
        text: 'Golden Brown',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/eyes/turquoise.jpg',
        text: 'Turquoise',
        category: category[0],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
    ],
  ),
];

//




// final xyz = [
//   // 1st Question eyes
//   Question(
//     questionText: 'Which color best describes your  color?',
//     answers: [
//       // MainAnswer(
//       //   id: 1,
//       //   imageUrl: 'assets/images/eyes/black.jpg',
//       //   text: 'black',
//       //   moreInfo: '',
//       //   category: category[2],
//       //   nextQuestionIndex: -1, // Points to the next question
//       // ),
//       // MainAnswer(
//       //   id: 2,
//       //   imageUrl: 'assets/images/eyes/brownBlack.jpg',
//       //   text: 'Brown Black',
//       //   moreInfo: '',
//       //   category: category[2],
//       //   nextQuestionIndex: -1,
//       // ),
//       // MainAnswer(
//       //   id: 3,
//       //   imageUrl: 'assets/images/eyes/violet.jpg',
//       //   text: 'Violet',
//       //   moreInfo: '',
//       //   category: category[2],
//       //   nextQuestionIndex: -1,
//       // ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/eyes/darkGreen.jpg',
//         text: 'Dark Green',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/eyes/darkclearblue.jpg',
//         text: 'Dark Clear Blue',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       // MainAnswer(
//       //   id: 4,
//       //   imageUrl: 'assets/images/eyes/roseBrown.jpg',
//       //   text: 'Rose Brown',
//       //   category: category[3],
//       //   moreInfo: '',
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 4,
//       //   imageUrl: 'assets/images/eyes/blueGray.png',
//       //   text: 'Gray Blue',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 4,
//       //   imageUrl: 'assets/images/eyes/grayGreen.jpg',
//       //   text: 'Gray Green',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//     ],
//   ),
//   // 2nd question yes/no
//   Question(
//     questionText: '1. Do you have dark skin, black eyes and black hair?',
//     answers: [
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/tick.png',
//         text: 'Yes',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: -1, // Points to the next question
//       ),
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/cross.png',
//         text: 'No',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: 3, // Points to the next question
//       ),
//     ],
//   ),
//   // 3rd question yes/no
//   Question(
//     questionText: '2. Do you have strawberry or obvious red hair color?',
//     questionImage: "assets/images/hair/ss.jpeg",
//     answers: [
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/tick.png',
//         text: 'Yes',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: 4, // Points to the next question
//       ),
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/cross.png',
//         text: 'No',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: 5, // Points to the next question
//       ),
//     ],
//   ),
//   // 4 the question eyes
//   Question(
//     questionText: '3. Which color best describes your eye color?',
//     answers: [
//       MainAnswer(
//         id: 1,
//         imageUrl: 'assets/images/eyes/redBrown.jpg',
//         text: 'Warm Brown',
//         moreInfo: '',
//         category: category[0],
//         nextQuestionIndex: -1, // Points to the next question
//       ),
//       MainAnswer(
//         id: 2,
//         imageUrl: 'assets/images/eyes/darkAmber.jpg',
//         text: 'Dark Amber',
//         moreInfo: '',
//         category: category[0],
//         nextQuestionIndex: -1,
//       ),
//       MainAnswer(
//         id: 3,
//         imageUrl: 'assets/images/eyes/hazel.jpg',
//         text: 'Hazel',
//         moreInfo: '',
//         category: category[0],
//         nextQuestionIndex: -1,
//       ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/eyes/darkOlive.jpg',
//         text: 'Dark Olive',
//         moreInfo: '',
//         category: category[0],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 5,
//         imageUrl: 'assets/images/eyes/darkGreen.jpg',
//         text: 'Dark Green',
//         moreInfo: '',
//         category: category[0],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 6,
//         imageUrl: 'assets/images/eyes/turquoise.jpg',
//         text: 'Turquoise.',
//         category: category[1],
//         moreInfo: '',
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       // MainAnswer(
//       //   id: 7,
//       //   imageUrl: 'assets/images/eyes/lightOlive.jpg',
//       //   text: 'Light Olive',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 8,
//       //   imageUrl: 'assets/images/eyes/lightAmber.jpg',
//       //   text: 'Light Amber',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 9,
//       //   imageUrl: 'assets/images/eyes/clearBlue.jpg',
//       //   text: 'Clear Blue',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 10,
//       //   imageUrl: 'assets/images/eyes/clearGreen.jpg',
//       //   text: 'Clear Green',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 11,
//       //   imageUrl: 'assets/images/eyes/aqua.jpg',
//       //   text: 'Aqua',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//     ],
//   ),
//   // 5th Question yes/no
//   Question(
//     questionText: '3. Do you have light skin, light eyes and light hair color?',
//     answers: [
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/tick.png',
//         text: 'Yes',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: 6, // Points to the next question
//       ),
//       MainAnswer(
//         id: 1133,
//         imageUrl: 'assets/images/icons/cross.png',
//         text: 'No',
//         moreInfo: '',
//         category: category[2],
//         nextQuestionIndex: 7, // Points to the next question
//       ),
//     ],
//   ),
//   // 6th question eyes
//   Question(
//     questionText: '3. Which color best describes your eye color?',
//     answers: [
//       // MainAnswer(
//       //   id: 1,
//       //   imageUrl: 'assets/images/eyes/roseBrown.jpg',
//       //   text: 'Rose Brown',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1, // Points to the next question
//       // ),
//       // MainAnswer(
//       //   id: 2,
//       //   imageUrl: 'assets/images/eyes/blueGray.pngf',
//       //   text: 'Gray Blue',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1,
//       // ),
//       // MainAnswer(
//       //   id: 3,
//       //   imageUrl: 'assets/images/eyes/grayGreen.jpg',
//       //   text: 'Gray Green',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1,
//       // ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/eyes/Light-Clear-Blue.jpg',
//         text: 'Light Clear Blue',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 5,
//         imageUrl: 'assets/images/eyes/aqua.jpg',
//         text: 'Dark Green',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 6,
//         imageUrl: 'assets/images/eyes/lightAmber.jpg',
//         text: 'Light Amber.',
//         category: category[1],
//         moreInfo: '',
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 7,
//         imageUrl: 'assets/images/eyes/lightOlive.jpg',
//         text: 'Warm Green',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//     ],
//   ),
//   // 7th question hair
//   Question(
//     questionText:
//         '4. Which color best represents the level of your hair color?',
//     answers: [
//       MainAnswer(
//         id: 1,
//         imageUrl: 'assets/images/hair/10.-Light-Blonde.png',
//         text: 'Lightest Blonde',
//         moreInfo: '',
//         nextQuestionIndex: 8, // Points to the next question
//       ),
//       MainAnswer(
//         id: 2,
//         imageUrl: 'assets/images/hair/9.-Medium-Blonde-2.png',
//         text: 'Salt-and-Pepper',
//         moreInfo: '',
//         nextQuestionIndex: 8,
//       ),
//       MainAnswer(
//         id: 3,
//         imageUrl: 'assets/images/hair/8.-Dark-Blonde-2.png',
//         text: 'Dark Blonde',
//         moreInfo: '',
//         nextQuestionIndex: 8,
//       ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/hair/5.LightBrown.png',
//         text: 'Light Brown',
//         moreInfo: '',
//         nextQuestionIndex: 8, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 5,
//         imageUrl: 'assets/images/hair/4.MediumBrown.png',
//         text: 'Medium Brown',
//         moreInfo: '',
//         nextQuestionIndex: 8, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 6,
//         imageUrl: 'assets/images/hair/1.DarkBrown.png',
//         text: 'Dark Brown',
//         moreInfo: '',
//         nextQuestionIndex: 9, // Points to the next question
//       ),
//       MainAnswer(
//         id: 7,
//         imageUrl: 'assets/images/hair/2.DarkestBrownCircle.png',
//         text: 'Darkest Brown',
//         moreInfo: '',
//         nextQuestionIndex: 9,
//       ),
//       MainAnswer(
//         id: 8,
//         imageUrl: 'assets/images/hair/2.Brown2025.png',
//         text: 'Brown Black',
//         moreInfo: '',
//         nextQuestionIndex: 9,
//       ),
//       MainAnswer(
//         id: 9,
//         imageUrl: 'assets/images/hair/1.Black2025.png',
//         text: 'Black',
//         moreInfo: '',
//         nextQuestionIndex: 9, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 10,
//         imageUrl: 'assets/images/hair/Blue-Black.png',
//         text: 'Blue Black',
//         moreInfo: '',
//         nextQuestionIndex: 9, // This leads to a different question
//       ),
//     ],
//   ),
//   //8th Question Eyes
//   Question(
//     questionText: '5. Which color best describes your eye color?',
//     answers: [
//       MainAnswer(
//         id: 1,
//         imageUrl: 'assets/images/eyes/blueGray.png',
//         text: 'Gray Blue',
//         moreInfo: '',
//         category: category[3],
//         nextQuestionIndex: -1, // Points to the next question
//       ),
//       MainAnswer(
//         id: 2,
//         imageUrl: 'assets/images/eyes/grayGreen.jpg',
//         text: 'Gray Green',
//         moreInfo: '',
//         category: category[3],
//         nextQuestionIndex: -1,
//       ),
//       MainAnswer(
//         id: 3,
//         imageUrl: 'assets/images/eyes/roseBrown.jpg',
//         text: 'Rose-Brown',
//         moreInfo: '',
//         category: category[3],
//         nextQuestionIndex: -1,
//       ),
//       MainAnswer(
//         id: 4,
//         imageUrl: 'assets/images/eyes/clearGreen.jpg',
//         text: 'Clear Green',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 5,
//         imageUrl: 'assets/images/eyes/lightAmber.jpg',
//         text: 'Light Amber',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 6,
//         imageUrl: 'assets/images/eyes/clearBlue.jpg',
//         text: 'Bright Blue',
//         category: category[1],
//         moreInfo: '',
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 7,
//         imageUrl: 'assets/images/eyes/lightOlive.jpg',
//         text: 'Light Olive',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 8,
//         imageUrl: 'assets/images/eyes/aqua.jpg',
//         text: 'Aqua',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//     ],
//   ),
//   //8th Question Eyes
//   Question(
//     questionText: '5. Which color best describes your eye color?',
//     answers: [
//       // MainAnswer(
//       //   id: 1,
//       //   imageUrl: 'assets/images/eyes/goldenBrown.png',
//       //   text: 'Golden Brown',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1, // Points to the next question
//       // ),
//       // MainAnswer(
//       //   id: 2,
//       //   imageUrl: 'assets/images/eyes/darkAmber.jpg',
//       //   text: 'Dark Amber',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1,
//       // ),
//       // MainAnswer(
//       //   id: 3,
//       //   imageUrl: 'assets/images/eyes/hazel.jpg',
//       //   text: 'Hazel',
//       //   moreInfo: '',
//       //   category: category[3],
//       //   nextQuestionIndex: -1,
//       // ),
//       // MainAnswer(
//       //   id: 4,
//       //   imageUrl: 'assets/images/eyes/darkOlive.jpg',
//       //   text: 'Dark Olive',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       MainAnswer(
//         id: 5,
//         imageUrl: 'assets/images/eyes/darkGreen.jpg',
//         text: 'Dark Green',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       // MainAnswer(
//       //   id: 6,
//       //   imageUrl: 'assets/images/eyes/turquoise.jpg',
//       //   text: 'Turquoise',
//       //   category: category[1],
//       //   moreInfo: '',
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       // MainAnswer(
//       //   id: 7,
//       //   imageUrl: 'assets/images/eyes/black.jpg',
//       //   text: 'Black',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       MainAnswer(
//         id: 8,
//         imageUrl: 'assets/images/eyes/brownBlack.jpg',
//         text: 'Black-Brown',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       MainAnswer(
//         id: 9,
//         imageUrl: 'assets/images/eyes/clearGreen.jpg',
//         text: 'Clear Green',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//       // MainAnswer(
//       //   id: 10,
//       //   imageUrl: 'assets/images/eyes/brownRed.jpg',
//       //   text: 'Brown Red',
//       //   moreInfo: '',
//       //   category: category[1],
//       //   nextQuestionIndex: -1, // This leads to a different question
//       // ),
//       MainAnswer(
//         id: 11,
//         imageUrl: 'assets/images/eyes/violet.jpg',
//         text: 'Violet',
//         moreInfo: '',
//         category: category[1],
//         nextQuestionIndex: -1, // This leads to a different question
//       ),
//     ],
//   ),
// ];
