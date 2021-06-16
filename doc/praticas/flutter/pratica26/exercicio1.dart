import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Aplicativo()));

class Aplicativo extends StatefulWidget {
  @override
  State<Aplicativo> createState() => AplicativoState();
}

class AplicativoState extends State<Aplicativo> {
  int abaCorrente = 0;
  PageStorageBucket repositorio = PageStorageBucket();
  List pages = [
    Pagina(
      key: PageStorageKey('pagina Um'),
      cor1: Colors.blue,
      cor2: Colors.amber,
    ),
    Pagina(
      key: PageStorageKey('pagina Dois'),
      cor1: Colors.purple,
      cor2: Colors.amber,
    ),
    MenuExpansivel(
      key: PageStorageKey('pagina tres'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo: Preservando Estado das Páginas'),
      ),
      body: PageStorage(
        child: this.pages[this.abaCorrente],
        bucket: this.repositorio,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.abaCorrente,
        onTap: (indice) {
          setState(() => this.abaCorrente = indice);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'página1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'página2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'página3',
          ),
        ],
      ),
    );
  }
}

class Pagina extends StatelessWidget {
  final Color cor1, cor2;
  Pagina({Key? key, required this.cor1, required this.cor2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 130,
      itemBuilder: (BuildContext context, int index) => Container(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: index.isEven ? this.cor1 : this.cor2,
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                color: index.isEven ? this.cor2 : this.cor1,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuExpansivel extends StatelessWidget {
  final PageStorageBucket repositorio = PageStorageBucket();
  MenuExpansivel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: this.repositorio,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              ListaMenuExpansivel(
                key: PageStorageKey('alimentacao'),
                titulo: 'Alimentação',
                opcao1: 'Arroz',
                opcao2: 'Feijao',
                opcao3: 'Leite',
              ),
              ListaMenuExpansivel(
                key: PageStorageKey('vestuario'),
                titulo: 'Vestuário',
                opcao1: 'Calça',
                opcao2: 'Camisa',
                opcao3: 'Sapato',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListaMenuExpansivel extends StatelessWidget {
  final String titulo, opcao1, opcao2, opcao3;
  ListaMenuExpansivel({
    Key? key,
    required this.titulo,
    required this.opcao1,
    required this.opcao2,
    required this.opcao3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ExpansionTile(
              key: PageStorageKey('opcao ${this.titulo}'),
              title: Text(this.titulo),
              children: [
                ListTile(
                  title: Text(this.opcao1),
                ),
                ListTile(
                  title: Text(this.opcao2),
                ),
                ListTile(
                  title: Text(this.opcao3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
