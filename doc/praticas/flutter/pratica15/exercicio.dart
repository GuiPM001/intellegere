import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

class PrimeiraRota extends StatefulWidget {
  PrimeiraRotaState createState() {
    return PrimeiraRotaState();
  }
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${this.mensagem}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Segunda Rota'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaRota()),
                ).then((resposta) {
                  setState(() => this.mensagem = resposta);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final TextEditingController num01Controller = TextEditingController();
  final TextEditingController num02Controller = TextEditingController();
  somar() {
    double num01 = double.parse(this.num01Controller.text);
    double num02 = double.parse(this.num02Controller.text);
    double soma = num01 + num02;
    return '$num01 + $num02 = $soma';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota"),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: this.num01Controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => this.num01Controller.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'informe o primeiro número',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: this.num02Controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => this.num02Controller.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'informe o segundo número',
            ),
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  String resp = somar();
                  Navigator.pop(context, resp);
                },
                child: Text(
                  'Voltar para primeira página',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
