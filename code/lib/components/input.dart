import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  const Input({this.controller, this.hintText, this.obscure});

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 50,
      width: 290,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 0, bottom: 5, // HERE THE IMPORTANT PART
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                color: Color(0XFF616161),
                fontWeight: FontWeight.w700),
            border: InputBorder.none),
      ),
    ));
  }
}
