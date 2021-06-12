import 'package:flutter/material.dart';
import 'package:intellegere/components/play_again.dart';
import 'package:intellegere/components/return_button.dart';
import 'package:maze/maze.dart';

class MazeScreen extends StatefulWidget {
  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  bool finish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Row(
            children: [
              ReturnButton(
                press: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text('LABIRINTO',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        fontWeight: FontWeight.w900)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'AJUDE O ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Nunito',
                    ),
                    children: [
                      TextSpan(
                          text: ' MENINO ',
                          style: TextStyle(
                              color: Color(0XFF9538FF),
                              fontFamily: 'Nunito',
                              fontSize: 22,
                              fontWeight: FontWeight.w900)),
                      TextSpan(text: ' A \nCHEGAR EM SUA '),
                      TextSpan(
                          text: ' CASA ',
                          style: TextStyle(
                              color: Color(0XFF9538FF),
                              fontFamily: 'Nunito',
                              fontSize: 22,
                              fontWeight: FontWeight.w900)),
                    ]))),
        SizedBox(
          height: 40,
        ),
        finish == false
            ? Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Maze(
                    player: MazeItem("assets/maze/pessoa.png", ImageType.asset),
                    columns: 8,
                    rows: 10,
                    wallThickness: 5.0,
                    wallColor: Colors.blue,
                    finish: MazeItem("assets/maze/casa.png", ImageType.asset),
                    onFinish: () {
                      setState(() {
                        finish = true;
                      });
                    }))
            : Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VOCÊ CONSEGUIU!!',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Nunito'),
                    ),
                    SizedBox(height: 20),
                    PlayAgain(
                      press: () {
                        setState(() {
                          finish = false;
                        });
                      },
                    )
                  ],
                ))
      ],
    ));
  }
}
