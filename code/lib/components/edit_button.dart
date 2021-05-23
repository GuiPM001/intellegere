import 'package:flutter/material.dart';
import 'package:intellegere/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditButton extends StatelessWidget {
  final Function press;
  const EditButton({this.press});

  @override
  Widget build(BuildContext context) {
    return (Positioned(
      top: 40,
      right: 15,
      child: Container(
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(shape: BoxShape.circle, gradient: yellowGradient),
        child: MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: press,
            child: SvgPicture.asset('assets/icons/pencil.svg',
                height: 22, color: Colors.white)),
      ),
    ));
  }
}
