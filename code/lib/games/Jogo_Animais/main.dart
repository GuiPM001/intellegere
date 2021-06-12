import 'package:flutter/material.dart';
import 'package:intellegere/components/play_again.dart';
import 'package:intellegere/components/return_button.dart';
import 'dart:math';

class ABCAnimais extends StatefulWidget {
  ABCAnimais({Key key}) : super(key: key);

  createState() => ABCAnimaisState();
}

class ABCAnimaisState extends State<ABCAnimais> {
  final Map<String, bool> score = {};

  final Map choices = {
    '🐕': Text('CA-CHO-RRO',
        style: TextStyle(
            color: Colors.yellowAccent[700],
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🐟': Text('PEI-XE',
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🐇': Text('CO-E-LHO',
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🐎': Text('CA-VA-LO',
        style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🐊': Text('JA-CA-RÉ',
        style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🐒': Text('MA-CA-CO',
        style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
  };

  // Número aleatório para misturar as opções
  int seed = 0;

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
                  padding: EdgeInsets.only(left: 25),
                  child: Text('ABC DOS ANIMAIS',
                      style: TextStyle(
                          color: Color(0XFF008000),
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
                      text: 'LIGUE O ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Nunito',
                      ),
                      children: [
                        TextSpan(
                            text: ' ANIMAL ',
                            style: TextStyle(
                                color: Color(0XFFFF7A00),
                                fontFamily: 'Nunito',
                                fontSize: 22,
                                fontWeight: FontWeight.w900)),
                        TextSpan(text: ' NO '),
                        TextSpan(
                            text: ' NOME ',
                            style: TextStyle(
                                color: Color(0XFFFF7A00),
                                fontFamily: 'Nunito',
                                fontSize: 22,
                                fontWeight: FontWeight.w900)),
                        TextSpan(text: ' \nPARA FAZER '),
                        TextSpan(
                            text: ' PONTOS ',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Nunito',
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            )),
                      ]))),
          SizedBox(
            height: 40,
          ),
          Text(
            "PONTOS:  ${score.length} / 6",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito'),
          ),
          SizedBox(
            height: 20,
          ),
          score.length != 6
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: choices.keys.map((animal) {
                            return Draggable<String>(
                              data: animal,
                              child: Animal(
                                  animal: score[animal] == true ? '' : animal),
                              feedback: Animal(animal: animal),
                              childWhenDragging: Animal(animal: '🔸'),
                            );
                          }).toList()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: choices.keys
                            .map((emoji) => _buildDragTarget(emoji))
                            .toList()
                              ..shuffle(Random(seed)),
                      )
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'VOCÊ GANHOU!!',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Nunito'),
                      ),
                      SizedBox(height: 20),
                      PlayAgain(
                        press: () {
                          setState(() {
                            score.clear();
                            seed++;
                          });
                        },
                      )
                    ],
                  ))
        ],
      ),
    );
  }

  Widget _buildDragTarget(animal) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[animal] == true) {
          return Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            height: 50,
            width: 150,
          );
        } else {
          return Container(
              margin: EdgeInsets.only(left: 80), child: choices[animal]);
        }
      },
      onWillAccept: (data) => data == animal,
      onAccept: (data) {
        setState(() {
          score[animal] = true;
        });
      },
      onLeave: (data) {},
    );
  }
}

class Animal extends StatelessWidget {
  Animal({Key key, this.animal}) : super(key: key);

  final String animal;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 75,
        padding: EdgeInsets.all(10),
        child: Text(
          animal,
          style: TextStyle(color: Colors.black, fontSize: 45),
        ),
      ),
    );
  }
}
