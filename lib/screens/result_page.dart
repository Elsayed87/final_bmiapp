import 'package:flutter/material.dart';

import '../constants.dart';
import 'bmi_body.dart';

class ResultScreen extends StatelessWidget {
 ResultScreen({
   required this.bmi,required this.result,required this.recomendation
});
 final String bmi;
 final String result;
 final String recomendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI RESULT',
            style: kAppBarTextStyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Container(
             margin: EdgeInsets.all(10),
             child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
           ),
            Expanded(
              flex: 4,
              child: ReusableCard(
                OnTap: () {},
                colour: kInActiveCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                      Text(bmi.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                       recomendation.toString(),
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 8),
                height: 38,
                width: double.infinity,
                alignment: Alignment.center,

                decoration: BoxDecoration( color: Colors.pinkAccent,borderRadius: BorderRadius.only(topRight:Radius.circular(25),topLeft: Radius.circular(25) )),
                child: Text(
                  'recalculate'.toUpperCase(),
                  style: kLabelTextStyle,
                ),
              ),
            )
          ],

        ),
    );
  }
}
