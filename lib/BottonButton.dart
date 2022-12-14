import 'package:flutter/material.dart';
import 'conastant.dart';



class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap,required this.buttonTitle});

final Function onTap;
final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
            onTap:(){
              onTap();
            },
            child: Container(
              child: Center(
                child: Text(buttonTitle,style: kLargeButtonTextStyle,)
                ),
              color: bottomConteinerColour,
              padding: EdgeInsets.only(bottom: 15.0),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomConteinerHeight,
            ),
          );
  }
}