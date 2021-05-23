import 'package:flutter/material.dart';
import 'package:intellegere/pages/Profile/components/profile_not_logged.dart';
import 'package:intellegere/pages/Profile/components/profile_logged.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static isLogged() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFFFFEED),
        body: SafeArea(
          child: Stack(
            children: [
              isLogged() == true ? ProfileLogged() : ProfileNotLogged(),
            ],
          ),
        ));
  }
}
