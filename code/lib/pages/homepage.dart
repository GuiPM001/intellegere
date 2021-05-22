import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120, bottom: 85),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 230,
              ),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 3,
                        offset: Offset(0, 5))
                  ],
                  borderRadius: BorderRadius.circular(30),
                  gradient: redGradient),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game_list');
                },
                child: Text('JOGAR!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cherry Bomb',
                        fontSize: 30)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 135,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 3,
                        offset: Offset(0, 5))
                  ],
                  borderRadius: BorderRadius.circular(30),
                  gradient: yellowGradient),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_page');
                },
                child: Text('ENTRAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cherry Bomb',
                        fontSize: 22)),
              ),
            )
          ],
        )
      ],
    ));
  }
}
