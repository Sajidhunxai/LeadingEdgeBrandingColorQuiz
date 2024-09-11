import 'package:colorquizapp/constants/constants.dart';
import 'package:flutter/material.dart';

class InstructionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'INSTRUCTIONS',
            textAlign: TextAlign.center,
            style: AppConstants.heading2TextStyle,
          ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
                text: '1. This quiz should only take you about.',
                children: <TextSpan>[
                  TextSpan(
                    text: '3 minutes to complete.',
                    style: AppConstants.paragraphTextStyle.copyWith(
                      color: AppConstants
                          .primaryColor, // Change color for this part
                      fontWeight: FontWeight.bold, // (Optional) Make it bold
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 10),
          const Text(
            '2. Once you select an answer to a question, on the bottom right of your screen, click the right arrow to move to the next question.',
            style: AppConstants.paragraphTextStyle,
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text:
                  '3. You\'ll know that you have finished the quiz once the APP identifies your ',
              style: AppConstants.paragraphTextStyle, // Base style for the text
              children: <TextSpan>[
                TextSpan(
                  text: 'Digital Seasonal Color Palette',
                  style: AppConstants.paragraphTextStyle.copyWith(
                    color:
                        AppConstants.primaryColor, // Change color for this part
                    fontWeight: FontWeight.bold, // (Optional) Make it bold
                  ),
                ),
                const TextSpan(
                  text: ' as either Spring, Autumn, Summer, or Winter.',
                  style: AppConstants
                      .paragraphTextStyle, // Continue with the base style
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
           
          
          Text.rich(
            TextSpan(
                text: '4. PLEASE NOTE: Your email will ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'never be sold or shared ',
                    style: AppConstants.paragraphTextStyle.copyWith(
                      color: AppConstants
                          .primaryColor, // Change color for this part
                      fontWeight: FontWeight.bold, // (Optional) Make it bold
                    ),
                  ),
                  const TextSpan(
                    text: 'under any circumstances. It will only be utilized for our internal records to ensure organized data management for your workshop. We assure anonymity by not linking your name to your questions. ',
                    style: AppConstants.paragraphTextStyle,
                  ),
                ]),
          ),
          
         
        ],
      ),
    );
  }
}
