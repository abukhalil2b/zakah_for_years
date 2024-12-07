import 'package:flutter/material.dart';

import 'constant.dart';

class ReuseCard extends StatelessWidget {
  ReuseCard({this.colour, required this.cardChild, this.onPress});

  final Color? colour;
  final Widget cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(3.0),
          child: cardChild,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(15.0),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: gradientButton,
    boxShadow: buttonBoxShadow,
            border: Border.all(color: Color(0xffffffff)),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(15.0),
        ),
      ]),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;
  IconContent({required this.icon, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: kIconColour,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Center(
          child:
              Text(lable, textAlign: TextAlign.center, style: kLableTextStyle),
        )
      ],
    );
  }
}

const buttonBoxShadow = [BoxShadow(blurRadius: 10,spreadRadius: -2,color: kColorWhiteOpacity,offset: Offset(1,3))];
const gradientButton = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
  colors: <Color>[Color(0x99ffffff), Color(0x1Affffff)], // red to yellow
  tileMode: TileMode.repeated, // repeats the gradient over the canvas
);

const kColorWhiteOpacity = Color(0x40ffffff);
