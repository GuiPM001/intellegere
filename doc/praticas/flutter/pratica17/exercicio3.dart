import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
        TerceiraRota.caminhoDaRota: (context) => TerceiraRota(),
      },
    );
  }
}

TextEditingController realController = TextEditingController();
TextEditingController dollarController = TextEditingController();

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Primeira Rota'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: realController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => realController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'informe o valor em real',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("Navegar para a Segunda Rota"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RotaGenerica.caminhoDaRota,
                    arguments: ArgumentosDaRota(
                      'Segunda Rota',
                      (double.parse(realController.text)),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';

  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
        appBar: AppBar(
          title: Text(argumentos.titulo),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: dollarController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => dollarController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'informe o valor em dollar',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("Navegar para a Terceira Rota"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    TerceiraRota.caminhoDaRota,
                    arguments: ArgumentosRota3(
                      'Terceira Rota',
                      (double.parse(realController.text)),
                      (double.parse(dollarController.text)),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class TerceiraRota extends StatelessWidget {
  static const caminhoDaRota = '/terceira';

  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.titulo),
      ),
    );
  }
}

class ArgumentosRota3 {
  String titulo2;
  double real;
  double dollar;

  ArgumentosRota3(this.titulo2, this.real, this.dollar);
}

class ArgumentosDaRota {
  String titulo;
  double real;

  ArgumentosDaRota(this.titulo, this.real);
}
