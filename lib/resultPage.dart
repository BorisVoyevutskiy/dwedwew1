import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'conastant.dart';
import 'BottonButton.dart';


class ResultPage extends StatelessWidget {
   ResultPage({required this.bmiResult,required this.ineterpretation,required this.resultText});

   final String bmiResult;
   final String resultText;
   final String ineterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child:Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child:Text(
              'Your Result',
              style: kTitleTextStyle,
              )
            ),
          ),
          Expanded(
            flex:4,
            child:reusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),style:kResultTextStyle ,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text(ineterpretation,style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
                ),
              )
            ),
            BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
             buttonTitle:'Re-CALCULATE'
             ),
          ],
        )
      );
  }
}