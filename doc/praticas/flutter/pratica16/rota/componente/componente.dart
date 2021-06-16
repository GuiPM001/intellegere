import 'package:flutter/material.dart';

class Corpo extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  Corpo(this.titulo, this.subtitulo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '${this.titulo}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '${this.subtitulo}',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
