import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/game_list.dart';
import 'pages/profile.dart';

void main() {
  runApp(Routes());
}

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login_page': (context) => Login(),
        '/register_page': (context) => Register(),
        '/game_list': (context) => GameList(),
        '/profile': (context) => Profile(),
      },
    ));
  }
}
