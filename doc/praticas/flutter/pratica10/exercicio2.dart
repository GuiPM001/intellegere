import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String resultado = '';
  String classificacao = '';

  calcularIMC() {
    double peso = double.parse(this.pesoController.text);
    double altura = double.parse(this.alturaController.text);
    double calculo = (peso / (altura * altura));
    this.resultado = '$calculo';
    exibirClassificacao(calculo);
    return this.resultado;
  }

  exibirClassificacao(calculo) {
    if (calculo < 16) {
      classificacao = 'Magraza grave';
    } else if (calculo >= 16 && calculo < 17) {
      classificacao = 'Magraza moderada';
    } else if (calculo >= 17 && calculo < 18.5) {
      classificacao = 'Magreza leve';
    } else if (calculo >= 18.5 && calculo < 25) {
      classificacao = 'Saudável';
    } else if (calculo >= 25 && calculo < 30) {
      classificacao = 'Sobrepeso';
    } else if (calculo >= 30 && calculo < 35) {
      classificacao = 'Obrsidade Grau I';
    } else if (calculo >= 35 && calculo < 40) {
      classificacao = 'Obesidade Grau II (severa)';
    } else if (calculo >= 40) {
      classificacao = 'Obesidade Grau III (mórbida)';
    }
    this.classificacao = '$classificacao';
    return this.classificacao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: pesoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => pesoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe seu peso',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: alturaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => alturaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe sua altura',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(calcularIMC());
              setState(calcularIMC);
            },
            child: Text(
              'Calcular IMC',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: (Text(
              this.resultado,
              style: TextStyle(
                fontSize: 20,
              ),
            )),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              this.classificacao,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
