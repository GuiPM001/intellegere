import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellegere/components/logout_button.dart';
import 'package:intellegere/components/profile_button.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    bool isLogged;

    if (arguments['logged'] == true) {
      isLogged = true;
    } else if (arguments['logged'] == false) {
      isLogged = false;
    }

    return Scaffold(
      backgroundColor: Color(0XFFFFEEEE),
      body: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LogOutButton(
                  press: () {
                    Navigator.pushNamed(context, '/',
                        arguments: {'logged': false});
                  },
                ),
                SvgPicture.asset(
                  'assets/images/text_logo.svg',
                ),
                ProfileButton(
                  press: () {
                    Navigator.pushNamed(context, '/profile',
                        arguments: {'logged': isLogged});
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.width * 2,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/Jogo_da_Memoria.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/jogo-da-memoria');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/ABC_Frutas.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/jogo-frutas');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/ABC_Animais.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/jogo-animais');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/Labirinto.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/jogo-labirinto');
                    },
                  ),
                  SizedBox(height: 20)
                ],
              )),
        ],
      ),
    );
  }
}
