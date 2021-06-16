import 'package:flutter/material.dart';
import 'package:pratica01/pratica21/rotas.dart';

main() => runApp(
      MaterialApp(
        home: Inicio(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Inicio extends StatefulWidget {
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  int indice = 0;

  final List<Widget> rotas = [
    PrimeiraRota(),
    SegundaRota(),
  ];

  void aoPressionar(int indiceRotaSelecionada) {
    setState(
      () {
        this.indice = indiceRotaSelecionada;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rotas[this.indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.indice,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Primeira Rota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Segunda Rota',
          ),
        ],
        onTap: (indiceRotaSelecionada) {
          aoPressionar(indiceRotaSelecionada);
        },
      ),
    );
  }
}
