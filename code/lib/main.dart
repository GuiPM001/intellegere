import 'package:flutter/material.dart';
import 'package:intellegere/pages/homepage.dart';
import 'package:intellegere/pages/login_page.dart';
import 'package:intellegere/pages/register_page.dart';
import 'package:intellegere/pages/game_list.dart';
import 'package:intellegere/pages/Profile/profile.dart';

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
