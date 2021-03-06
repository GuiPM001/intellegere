import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intellegere/components/play_again.dart';
import 'package:intellegere/components/return_button.dart';
import 'package:intellegere/games/Jogo_Memoria/cards.dart';
import 'package:intellegere/games/Jogo_Memoria/cardModel.dart';

class JogoDaMemoria extends StatefulWidget {
  @override
  _JogoDaMemoriaState createState() => _JogoDaMemoriaState();
}

class _JogoDaMemoriaState extends State<JogoDaMemoria> {
  List<CardModel> gridViewTiles = <CardModel>[];
  List<CardModel> questionPairs = <CardModel>[];

  @override
  void initState() {
    super.initState();
    score = 0;
    restart();
  }

  void restart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFCF7FC),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ReturnButton(
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('JOGO DA MEMÓRIA',
                        style: TextStyle(
                            color: Color(0XFFAB62FF),
                            fontFamily: 'Nunito',
                            fontSize: 26,
                            fontWeight: FontWeight.w900)),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'ENCONTRE OS ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Nunito',
                          ),
                          children: [
                            TextSpan(
                                text: ' PARES ',
                                style: TextStyle(
                                    color: Color(0XFFFF0000),
                                    fontFamily: 'Nunito',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900)),
                            TextSpan(text: ' DE CARTAS '),
                            TextSpan(
                                text: ' IGUAIS ',
                                style: TextStyle(
                                    color: Color(0XFFFF0000),
                                    fontFamily: 'Nunito',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900)),
                            TextSpan(text: ' PARA FAZER '),
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
                "PONTOS:  $score / 6",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'),
              ),
              score != 6
                  ? GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 15.0, maxCrossAxisExtent: 120.0),
                      children: List.generate(gridViewTiles.length, (index) {
                        return Card(
                          imagePathUrl:
                              gridViewTiles[index].getImageAssetPath(),
                          tileIndex: index,
                          parent: this,
                        );
                      }),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.7,
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
                          PlayAgain(press: () {
                            setState(() {
                              score = 0;
                              myPairs = getPairs();
                              myPairs.shuffle();

                              gridViewTiles = myPairs;
                              Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  questionPairs = getQuestionPairs();
                                  gridViewTiles = questionPairs;
                                  selected = false;
                                });
                              });
                            });
                          })
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _JogoDaMemoriaState parent;

  Card({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedCard != "") {
            if (selectedCard == myPairs[widget.tileIndex].getImageAssetPath()) {
              score = score + 1;

              CardModel cardModel = CardModel();
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                cardModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = cardModel;
                myPairs[selectedIndex] = cardModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedCard = "";
              });
            } else {
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedCard = "";
            }
          } else {
            setState(() {
              selectedCard = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Container(
                color: Colors.white,
                child: Image.asset("assets/memory_game/correto.png"),
              ),
      ),
    );
  }
}
