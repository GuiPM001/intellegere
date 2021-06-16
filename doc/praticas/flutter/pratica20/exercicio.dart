import 'package:flutter/material.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int indice = 0;
  static const TextStyle estiloParaTexto =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> telas = <Widget>[
    Image(
      image: NetworkImage(
          'https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
    ),
    Image(
      image: NetworkImage(
          'https://i.pinimg.com/originals/3c/02/c0/3c02c07c231fd281808c734e26a6aacb.jpg'),
    ),
    Image(
      image: NetworkImage(
          'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    ),
  ];
  void selecionar(int indice) {
    setState(() => this.indice = indice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PáginaInicial'),
      ),
      body: Center(
        child: telas.elementAt(this.indice),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Animais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Programação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_restaurant),
            label: 'Alimentação',
          ),
        ],
        currentIndex: this.indice,
        selectedItemColor: Colors.amber[800],
        onTap: selecionar,
      ),
    );
  }
}
