import 'package:flutter/material.dart';
import 'package:intellegere/components/register_button.dart';
import 'package:intellegere/components/return_button.dart';
import 'package:intellegere/components/login_button.dart';

class ProfileNotLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(15),
        child: ReturnButton(
          press: () {
            Navigator.pop(context);
          },
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 175,
              width: 320,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF282726)),
              child: RichText(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Peça ajuda aos seus ',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                          color: Colors.white,
                        )),
                    TextSpan(
                        text: 'pais ',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                            color: Color(0XFFFF8205))),
                    TextSpan(
                        text: 'e crie uma conta para salvar seu ',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                          color: Colors.white,
                        )),
                    TextSpan(
                        text: 'progresso',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                            color: Color(0XFFFF8205))),
                  ]))),
          SizedBox(height: 60),
          RegisterButton(
            press: () {
              Navigator.pushNamed(context, '/register_page');
            },
          ),
          SizedBox(height: 40),
          Text('ou entre na sua conta',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  color: Color(0XFF282726),
                  fontWeight: FontWeight.w800)),
          LoginButton(press: () {
            Navigator.pushNamed(context, '/login_page');
          })
        ],
      ),
    ]);
  }
}
