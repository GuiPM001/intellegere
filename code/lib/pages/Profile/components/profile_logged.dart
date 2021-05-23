import 'package:flutter/material.dart';
import 'package:intellegere/components/return_button.dart';
import 'package:intellegere/components/edit_button.dart';

class ProfileLogged extends StatefulWidget {
  @override
  _ProfileLoggedState createState() => _ProfileLoggedState();
}

class _ProfileLoggedState extends State<ProfileLogged> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReturnButton(
              press: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            EditButton(
              press: () {},
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 160,
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Color(0XFFFFAB5E), width: 4)),
            child: Text('Foto de perfil'),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 35, left: 25),
              child: Text('NOME E SOBRENOME',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      color: Color(0XFF282726),
                      fontWeight: FontWeight.w700))),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 25),
              child: Text('IDADE',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      color: Color(0XFF282726),
                      fontWeight: FontWeight.w700))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 2,
            color: Color(0XFF282726),
          ),
          Text('MEUS PRÊMIOS',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 26,
                  color: Color(0XFF282726),
                  fontWeight: FontWeight.w800))
        ],
      ),
    ]);
  }
}
