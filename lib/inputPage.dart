import 'package:bmi_calculator/resultPage.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'conastant.dart';
import 'IconContent.dart';
import 'roundIconButton.dart';
import 'resultPage.dart';
import 'BottonButton.dart';
import 'BMIBrain/brain_BMI.dart';

enum Gender{male,female}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 167;
  int weight = 55;
  int age = 25;
  
 

 /* Color maleCardColour = kInactiveCardColur;
  Color femaleCardColour = kInactiveCardColur;
 
  void updateColour(Gender selectedGender){
    if(selectedGender == Gender.male){
      if(maleCardColour == kInactiveCardColur){
        maleCardColour = kActiveCardColour;
        femaleCardColour = kInactiveCardColur;
      }else{ maleCardColour = kInactiveCardColur;}
    }
    
    if(selectedGender == Gender.female){
        if(femaleCardColour == kInactiveCardColur){
          femaleCardColour = kActiveCardColour;
          maleCardColour = kInactiveCardColur;
        }else{femaleCardColour = kInactiveCardColur;}
    }
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Row(
              children: [
              //MaleCard
                Expanded(
                  child: reusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColour :kInactiveCardColur,
                   cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    lable: 'MALE'  )
                    ),
                  ),
              //WomanCArd
                Expanded(
                    child:reusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColur,
                   cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    lable: 'FEMALE')
                   ),
                  ),
                ]
              ),
            ),
            Expanded(
              child: reusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('HEIGHT',style: klableTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style:kNumberTextStyle),
                        Text('cm',style: klableTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98) ,
                        activeTrackColor: Colors.white,
                        thumbColor: bottomConteinerColour,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0)
                      ), 
                      child:Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 230.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }
                    )
                  )
                  ]
                )
              ),
            ),
            Expanded(
              child:Row(
                children: [
                  Expanded(
                    child: reusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style:klableTextStyle,),
                          Text(weight.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed:(){
                                  setState(() {
                                    weight --;
                                  });
                                } ,
                                ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed:(){
                                  setState(() {
                                    weight++;
                                  });
                                } ,
                              ),
                            ],
                          ),
                        ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:reusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: klableTextStyle,),
                            Text(age.toString(),style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon:FontAwesomeIcons.minus ,
                                 onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                 }
                                 ),
                                 SizedBox(width: 10.0,),
                                  RoundIconButton(icon:FontAwesomeIcons.plus ,
                                 onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                 }
                                 ),
                              ],
                            )
                          ],
                          ),
                        ),
                      ),
                  ],
                )
              ),
         BottomButton(
          onTap:(){

            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder:(context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                 ineterpretation:calc.getInterpretation(),
                  resultText: calc.getResult(),

              )),);
            },
          buttonTitle:'CALCULATE'
          ),
        ],
      ),
    );
  }
}




