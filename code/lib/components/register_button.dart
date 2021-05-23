import 'package:flutter/material.dart';
import 'package:intellegere/constants.dart';

class RegisterButton extends StatelessWidget {
  final Function press;
  const RegisterButton({this.press});

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.only(top: 5),
      width: 200,
      height: 45,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 3,
            offset: Offset(0, 5))
      ], borderRadius: BorderRadius.circular(30), gradient: yellowGradient),
      child: MaterialButton(
        onPressed: press,
        child: Text('CADASTRAR',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Cherry Bomb', fontSize: 24)),
      ),
    ));
  }
}
