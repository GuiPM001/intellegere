import 'package:flutter/material.dart';
import 'package:intellegere/components/play_again.dart';
import 'package:intellegere/components/return_button.dart';
import 'dart:math';

class ABCFrutas extends StatefulWidget {
  ABCFrutas({Key key}) : super(key: key);

  createState() => ABCFrutasState();
}

class ABCFrutasState extends State<ABCFrutas> {
  final Map<String, bool> score = {};

  final Map choices = {
    '🍍': Text('A-BA-CA-XI',
        style: TextStyle(
            color: Colors.lime,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🍓': Text('MO-RAN-GO',
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🍌': Text('BA-NA-NA',
        style: TextStyle(
            color: Colors.yellowAccent[700],
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🍇': Text('U-VA',
        style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🍎': Text('MA-ÇÃ',
        style: TextStyle(
            color: Colors.redAccent[400],
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
            fontSize: 26)),
    '🍊': Text('LA-RAN-JA',
        style: TextStyle(
            color: Colors.orange,
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
                  padding: EdgeInsets.only(left: 30),
                  child: Text('ABC DAS FRUTAS',
                      style: TextStyle(
                          color: Color(0XFFFF0000),
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
                      text: 'LIGUE A ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Nunito',
                      ),
                      children: [
                        TextSpan(
                            text: ' FRUTA ',
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
                          children: choices.keys.map((fruta) {
                            return Draggable<String>(
                              data: fruta,
                              child: Fruta(
                                  fruta: score[fruta] == true ? '' : fruta),
                              feedback: Fruta(fruta: fruta),
                              childWhenDragging: Fruta(fruta: '🔸'),
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

  Widget _buildDragTarget(fruta) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[fruta] == true) {
          return Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            height: 50,
            width: 150,
          );
        } else {
          return Container(
              margin: EdgeInsets.only(left: 80), child: choices[fruta]);
        }
      },
      onWillAccept: (data) => data == fruta,
      onAccept: (data) {
        setState(() {
          score[fruta] = true;
        });
      },
      onLeave: (data) {},
    );
  }
}

class Fruta extends StatelessWidget {
  Fruta({Key key, this.fruta}) : super(key: key);

  final String fruta;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 75,
        padding: EdgeInsets.all(10),
        child: Text(
          fruta,
          style: TextStyle(color: Colors.black, fontSize: 45),
        ),
      ),
    );
  }
}
