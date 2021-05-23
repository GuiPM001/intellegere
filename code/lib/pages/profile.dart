import 'package:flutter/material.dart';
import '../components/register_button.dart';
import '../components/return_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFEED),
      body: SafeArea(
          child: Stack(fit: StackFit.expand, children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(25),
          child: ReturnButton(
            press: () {
              Navigator.pop(context);
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                          text: 'e crie uma conta para salval seu ',
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
          ],
        ),
      ])),
    );
  }
}

/* Text(
                  'Peça ajuda aos seus pais e crie uma conta para salvar seu progresso',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: Colors.white,
                  )), */
