import 'package:flutter/material.dart';
import 'conastant.dart';

class IconContent extends StatelessWidget {

  
  IconContent({ required this.icon,required this.lable});

 
  
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(height: 10.0,),
        Text(
          lable,
          style: klableTextStyle,
        )
      ],
    );
  }
}
