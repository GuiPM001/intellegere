import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrimeiraRota'),
      ),
      drawer: Container(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children: [
              SizedBox(
                height: 230,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text("Ana"),
                  accountEmail: Text("ana@ana.com.br"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                child: ListTile(
                  leading: Icon(Icons.video_collection),
                  title: Text("Rota02"),
                  subtitle: Text("SigaparaaRota02."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('IrparaaRota02.');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RotaGenerica(
                                'Segunda Rota', Colors.blue[900])));
                  },
                ),
              ),
              SizedBox(
                height: 130,
                child: ListTile(
                  leading: Icon(Icons.analytics),
                  title: Text("Rota03"),
                  subtitle: Text("SigaparaaRota03"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('IrparaaRota03.');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RotaGenerica(
                                'Terceira Rota', Colors.purple[900])));
                  },
                ),
              ),
              SizedBox(
                height: 130,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Rota01"),
                  subtitle: Text("VoltarparaaRota01"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('VoltarparaaRota01.');
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  final String titulo;
  final Color? cor;
  RotaGenerica(this.titulo, this.cor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this.titulo}'),
        ),
        body: Container(
            color: this.cor,
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${this.titulo} \n',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Navegar para a Primeira Rota"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )));
  }
}
