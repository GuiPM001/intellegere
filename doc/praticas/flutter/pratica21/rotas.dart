import 'package:flutter/material.dart';

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return Center(
      child: Text(
        'Primeira Rota',
        style: estilo,
      ),
    );
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Text(
              'Galeria',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Cartao(
          titulo: 'Imagem 01',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 3.10,
          url:
              'https://images.pexels.com/photos/213795/pexels-photo-213795.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 02',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 2.15,
          url:
              'https://images.pexels.com/photos/213791/pexels-photo-213791.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 03',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 2.95,
          url:
              'https://images.pexels.com/photos/213797/pexels-photo-213797.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 04',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 1.97,
          url:
              'https://images.pexels.com/photos/213798/pexels-photo-213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
      ],
    );
  }
}

class Cartao extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double preco;
  final String url;

  Cartao({
    required this.titulo,
    required this.subtitulo,
    required this.preco,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(30, 5, 30, 15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                image: NetworkImage(this.url),
                height: 200,
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.subtitulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'R\$ ${this.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text('DETALHES'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TerceiraRota(
                          titulo: this.titulo,
                          subtitulo: this.subtitulo,
                          preco: this.preco,
                          url: this.url,
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text('COMPRAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuartaRota(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TerceiraRota extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double preco;
  final String url;

  TerceiraRota({
    required this.titulo,
    required this.subtitulo,
    required this.preco,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(3),
              child: Image(
                image: NetworkImage(this.url),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                this.titulo,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                this.subtitulo,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                'R\$ ${this.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Voltar para a segunda rota',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuartaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.purple[700],
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              'Página de Compra',
              style: estilo,
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Voltar para a segunda rota',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
