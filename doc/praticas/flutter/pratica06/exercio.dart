import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              color: Colors.blueAccent,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.purple.withAlpha(0),
                    Colors.purple,
                    Colors.deepPurple
                  ],
                ),
              ),
            ),
            Container(
              width: 180,
              height: 150,
              padding: EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment(0.2, 0.8),
                child: Image.network(
                  'https://media.giphy.com/media/xT0xezQGU5xCDJuCPe/giphy.gif',
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
