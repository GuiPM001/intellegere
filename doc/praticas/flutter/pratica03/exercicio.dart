import 'package:flutter/material.dart';

void main() {
  String nome = "Ana";
  String dia = "quinta-feira";

  runApp(
    Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Olá, ",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ), //TextStyle.
          children: <TextSpan>[
            TextSpan(
              text: '$nome',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dotted,
                backgroundColor: Colors.green,
              ),
            ),
            TextSpan(
                text: '!',
                style: TextStyle(
                  color: Colors.green,
                )),
            TextSpan(
              text: '\n Hoje é $dia!',
              style: TextStyle(
                color: Colors.red,
                backgroundColor: Colors.yellow,
              ),
            ),
            TextSpan(
              text: '\n Bom dia!',
            ),
            TextSpan(
              text:
                  '\n\nHoje, você terá que escrever um aplicativo em Flutter. O aplicativo deve imprimir um texto na tela. O texto possui trechos com estilos diferentes.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                backgroundColor: Colors.black,
              ), //TextStyle.
            ),
            TextSpan(
              text: '\n\n\nBoa prática!',
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                backgroundColor: Colors.black,
              ), //TextStyle.
            ),
            TextSpan(
              text: '\n=',
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black,
              ), //TextStyle.
            ),
            TextSpan(
              text: 'D',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black,
              ), //TextStyle.
            ),
            TextSpan(
              text: 'H',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black,
              ), //TextStyle.
            )
          ],
        ),
      ),
    ),
  );
}
