import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellegere/constants.dart';

class ProfileButton extends StatelessWidget {
  final Function press;
  const ProfileButton({this.press});

  @override
  Widget build(BuildContext context) {
    return (Positioned(
      top: 40,
      right: 15,
      child: Container(
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(shape: BoxShape.circle, gradient: redGradient),
        child: MaterialButton(
            padding: EdgeInsets.only(left: 5),
            onPressed: press,
            child: SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 25,
            )),
      ),
    ));
  }
}
