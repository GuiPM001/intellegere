import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

TextEditingController tempcelsiusController = TextEditingController();

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
                controller: tempcelsiusController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => tempcelsiusController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'informe o valor em celcius',
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
                      (double.parse(tempcelsiusController.text)),
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

  converter(double celsius) => celsius * 1.8 + 32;

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
          Text(
            'Graus Celsius: ${argumentos.celsius.toStringAsFixed(2)} \n',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          Text(
            'Graus Fahrenheit: ${converter(argumentos.celsius).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class ArgumentosDaRota {
  String titulo;
  double celsius;

  ArgumentosDaRota(this.titulo, this.celsius);
}
