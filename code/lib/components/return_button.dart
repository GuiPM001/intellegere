import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class ReturnButton extends StatelessWidget {
  final Function press;
  const ReturnButton({this.press});

  @override
  Widget build(BuildContext context) {
    return (Positioned(
      top: 40,
      left: 15,
      child: Container(
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(shape: BoxShape.circle, gradient: yellowGradient),
        child: MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: press,
            child: SvgPicture.asset(
              'assets/icons/arrow-back.svg',
              height: 28,
            )),
      ),
    ));
  }
}
