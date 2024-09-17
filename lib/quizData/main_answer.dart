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
  dynamic questionImage;
  final List<MainAnswer> answers;

  Question({
    this.questionImage,
    required this.questionText,
    required this.answers,
  });
}

const category = ["Earth", "Fire", "Water", "Air"];

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
        nextQuestionIndex: 2, // Points to the next question
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/hair/3.SaltandPepper2025.png',
        text: 'Salt & Pepper',
        moreInfo: 'This hair color has black hair, mixed with white or silver.',
        nextQuestionIndex: 2,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/hair/6.White2025.png',
        text: 'Steely White',
        moreInfo:
            'Make sure that you do not have any presence of yellowish or gold tones in this category. If you do, DO NOT select this one!',
        nextQuestionIndex: 2,
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'I do not have gray hair',
        moreInfo: '',
        nextQuestionIndex: 3, // This leads to a different question
      ),
    ],
  ),
  // Option 2 Summer Eyes q1v1 index 1 Ash
  Question(
    questionText: 'Which color best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/roseBrown.jpg',
        text: 'Rose Brown',
        category: category[3],
        moreInfo: '',
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/blueGray.png',
        text: 'Gray Blue',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/gray.jpg',
        text: 'gray',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/grayGreen.jpg',
        text: 'Gray Green',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
    ],
  ),
  //option 1  Winter Eyes q1v2 index 2 selects Black, Salt pepper or Steely White
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
    questionText: 'Do you have dark hair, dark eyes and dark skin color?',
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
    questionText: 'Do you have lighter hair, eyes and skin color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/icons/tick.png',
        text: 'Yes',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 5,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 6,
      ),
    ],
  ),
  //option 5 question 5 spring and summer index 5
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/2.LightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/olive.jpg',
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
        id: 8,
        imageUrl: 'assets/images/eyes/gray.jpg',
        text: 'gray',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 9,
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
        nextQuestionIndex: 7,
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/icons/cross.png',
        text: 'No',
        moreInfo: '',
        category: '',
        nextQuestionIndex: 8,
      ),
    ],
  ),
  //option 7 quesntion 4 index 7
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/2.LightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/olive.jpg',
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
        category: category[0],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[0],
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
  //question 5 questtion 5 index 8
  Question(
    questionText: 'Which color best represents the value level (lightness or darkness) of your hair?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/hair/1.BlackCircle.png',
        text: 'Black',
        moreInfo: '',
        nextQuestionIndex: 11, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/hair/2.DarkestBrownCircle.png',
        text: 'Darkest Brown',
        moreInfo: '',
        nextQuestionIndex: 11,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/hair/3.DarkBrownCircle.png',
        text: 'Dark Brown',
        moreInfo: '',
        nextQuestionIndex: 11, // Points to the next question
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/hair/4.MediumBrown.png',
        text: 'Medium Brown',
        moreInfo: '',
        nextQuestionIndex: 11, // This leads to a different question
      ),
      MainAnswer(
        id: 5,
        imageUrl: 'assets/images/hair/5.LightBrownCircle.png',
        text: 'Light Brown',
        moreInfo: '',
        nextQuestionIndex: 9, // This leads to a different question
      ),
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/hair/6.DarkBlondeCircle.png',
        text: 'Dark Blonde',
        moreInfo: '',
        nextQuestionIndex: 9, // This leads to a different question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/hair/7.MediumBlondeCircle.png',
        text: 'Medium Blonde',
        moreInfo: '',
        nextQuestionIndex: 10, // This leads to a different question
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/hair/8.BlondeCircle.png',
        text: 'Blonde',
        moreInfo: '',
        nextQuestionIndex: 10, // This leads to a different question
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/hair/9.LightBlondeCircle.png',
        text: 'Light Blonde',
        moreInfo: '',
        nextQuestionIndex: 10 // This leads to a different question
      ),
      MainAnswer(
        id: 10,
        imageUrl: 'assets/images/hair/10.LightestBlondeCircle.png',
        text: 'Lightest Blonde',
        moreInfo: '',
        nextQuestionIndex: 10, // This leads to a different question
      ),
    ],
  ),
  //question 5v1 answer index 9 5-6 int
  Question( 
    questionText: 'Which best describes your eye color?',
    answers: [
       MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/goldenBrown.png',
        text: 'Golden Brown',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[0],
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
      MainAnswer(
        id: 6,
        imageUrl: 'assets/images/eyes/2.LightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/eyes/olive.jpg',
        text: 'Light Olive',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/eyes/clearGreen.jpg',
        text: 'Clear Green',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/eyes/clearBlue.jpg',
        text: 'Clear Blue',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 10,
        imageUrl: 'assets/images/eyes/aqua.jpg',
        text: 'Aqua',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
    ],
  ),
  //question 5v1 answer index 10 7-10 int
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
      MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/2.LightAmber.jpg',
        text: 'Light Amber',
        moreInfo: '',
        category: category[1],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/olive.jpg',
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
        imageUrl: 'assets/images/eyes/blueGray.png',
        text: 'Gray Blue',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/eyes/gray.jpg',
        text: 'gray',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/eyes/grayGreen.jpg',
        text: 'Gray Green',
        moreInfo: '',
        category: category[3],
        nextQuestionIndex: -1,
      ),
    ],
  ),
    //question 5v1 answer index 11 1-4 int
  Question(
    questionText: 'Which best describes your eye color?',
    answers: [
       MainAnswer(
        id: 1,
        imageUrl: 'assets/images/eyes/goldenBrown.png',
        text: 'Golden Brown',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 2,
        imageUrl: 'assets/images/eyes/darkAmber.jpg',
        text: 'Dark Amber',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 3,
        imageUrl: 'assets/images/eyes/hazel.jpg',
        text: 'Hazel',
        moreInfo: '',
        category: category[0],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 4,
        imageUrl: 'assets/images/eyes/darkOlive.jpg',
        text: 'Dark Olive',
        moreInfo: '',
        category: category[0],
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
       MainAnswer(
        id: 6,
        imageUrl: 'assets/images/eyes/black.jpg',
        text: 'black',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // Points to the next question
      ),
      MainAnswer(
        id: 7,
        imageUrl: 'assets/images/eyes/brownBlack.jpg',
        text: 'Brown Black',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ),
      MainAnswer(
        id: 8,
        imageUrl: 'assets/images/eyes/brownRed.jpg',
        text: 'Brown Red',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 9,
        imageUrl: 'assets/images/eyes/sapphireBlue.jpg',
        text: 'Sapphire',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ), // This leads to a different question
      MainAnswer(
        id: 10,
        imageUrl: 'assets/images/eyes/emeraldGreen.jpg',
        text: 'Emerald',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1, // This leads to a different question
      ),
      MainAnswer(
        id: 11,
        imageUrl: 'assets/images/eyes/violet.jpg',
        text: 'Violet',
        moreInfo: '',
        category: category[2],
        nextQuestionIndex: -1,
      ),
    ],
  ),
];

//


