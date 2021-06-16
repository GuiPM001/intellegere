import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);

  razao() => etanol / gasolina;
}

class PrimeiraRota extends StatelessWidget {
  final TextEditingController etanolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: etanolController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => etanolController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => gasolinaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço da gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Preco mensagem = Preco(
                double.parse(etanolController.text),
                double.parse(gasolinaController.text),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SegundaRota(mensagem)));
            },
            child: Text('Ir para a Segunda Rota'),
          ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco mensagem;
  SegundaRota(this.mensagem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${mensagem.etanol.toStringAsFixed(2)} / ${mensagem.gasolina.toStringAsFixed(2)} = ${mensagem.razao().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${mensagem.razao() < 0.7 ? "Abasteça com etanol!" : "Abasteça com gasolina!"}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
