import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/logout_button.dart';
import '../components/profile_button.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFEEEE),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogOutButton(
                  press: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                SvgPicture.asset(
                  'assets/images/text_logo.svg',
                ),
                ProfileButton(
                  press: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
