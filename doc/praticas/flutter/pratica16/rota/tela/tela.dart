import 'package:flutter/material.dart';

class Tela extends StatelessWidget {
  final String titulo;
  final Widget corpo;

  Tela(this.titulo, this.corpo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.titulo}'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            corpo,
          ],
        ),
      ),
    );
  }
}
