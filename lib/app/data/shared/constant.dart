import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(
        color: Color(0xff0cbab8),
      ),
    ),
  ),
);



const kHeaderTextStyle = TextStyle(
  fontSize: 18,overflow: TextOverflow.fade,
  color: Colors.white,
  fontFamily: 'Helve',
  fontWeight: FontWeight.w900
);
const kLableTextStyle = TextStyle(
  fontSize: 16.0,
  overflow: TextOverflow.clip,
  color: Colors.white,
  fontFamily: 'Helve',
  fontWeight: FontWeight.bold
);
const kBottonTextStyle = TextStyle(
  fontSize: 14.0,
  color: kPrimaryColor,
  fontFamily: 'Helve',
);
//colours
const kRedColor = Colors.red;
const kPrimaryColor = Color(0xffe79686);
const kIconColour = Color(0xffffffff);
const kActiveCardColour = Color(0xff716e77);
const kLightGreyColor = Color(0xffcdcdcd);
