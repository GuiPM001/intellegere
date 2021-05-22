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
          child: Column(children: [
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 175,
              width: 320,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF282726)),
              child: Text(
                  'Peça ajuda aos seus pais e crie uma conta para salvar seu progresso',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        RegisterButton(
          press: () {
            Navigator.pushNamed(context, '/register_page');
          },
        ),
      ])),
    );
  }
}
