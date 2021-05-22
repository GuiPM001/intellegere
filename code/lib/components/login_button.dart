import 'package:flutter/material.dart';
import '../constants.dart';

class LoginButton extends StatelessWidget {
  final Function press;
  const LoginButton({this.press});

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      width: 160,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 3,
            offset: Offset(0, 5))
      ], borderRadius: BorderRadius.circular(30), gradient: redGradient),
      child: MaterialButton(
        onPressed: press,
        child: Text('ENTRAR',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Cherry Bomb', fontSize: 26)),
      ),
    ));
  }
}
