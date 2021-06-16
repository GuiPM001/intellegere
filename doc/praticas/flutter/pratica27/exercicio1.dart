import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Aplicativo()));

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário')),
      body: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  FormularioState createState() => FormularioState();
}

class FormularioState extends State<Formulario> {
  final chaveFormulario = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  late FocusNode meuFoco1, meuFoco2, meuFoco3, meuFoco4;
  int contador = 0;
  @override
  void initState() {
    super.initState();
    this.meuFoco1 = FocusNode();
    this.meuFoco2 = FocusNode();
    this.meuFoco3 = FocusNode();
    this.meuFoco4 = FocusNode();
  }

  @override
  void dispose() {
    this.meuFoco1.dispose();
    this.meuFoco2.dispose();
    this.meuFoco3.dispose();
    this.meuFoco4.dispose();
    this.emailController.dispose();
    this.senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Form(
        key: this.chaveFormulario,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoTexto(
              nome: 'e-mail',
              textoController: this.emailController,
              foco: this.meuFoco1,
              autoFoco: true,
            ),
            SenhaMascara(
              senhaMascaraController: this.senhaController,
              foco: this.meuFoco4,
              autoFoco: true,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Próximo'),
                  focusNode: this.meuFoco2,
                  onPressed: () {
                    this.contador++;
                    switch (this.contador % 3) {
                      case 0:
                        meuFoco1.requestFocus();
                        break;
                      case 1:
                        meuFoco2.requestFocus();
                        break;
                      case 2:
                        meuFoco3.requestFocus();
                        break;
                      default:
                        meuFoco1.requestFocus();
                    }
                  },
                ),
                TextButton(
                  child: Text('Enviar'),
                  focusNode: this.meuFoco3,
                  onPressed: () {
                    if (this.chaveFormulario.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enviando os dados...'),
                          duration: Duration(milliseconds: 850),
                        ),
                      );
                      this.emailController.clear();
                      meuFoco1.requestFocus();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String nome;
  final TextEditingController textoController;
  final FocusNode foco;
  final bool autoFoco;
  CampoTexto({
    required this.nome,
    required this.textoController,
    required this.foco,
    required this.autoFoco,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.textoController,
      autofocus: this.autoFoco,
      focusNode: this.foco,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return '${this.nome} não informado.';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => this.textoController.clear(),
          icon: Icon(Icons.clear),
        ),
        border: OutlineInputBorder(),
        labelText: this.nome,
      ),
    );
  }
}

class SenhaMascara extends StatefulWidget {
  final TextEditingController senhaMascaraController;
  final FocusNode foco;
  final bool autoFoco;
  SenhaMascara({
    required this.senhaMascaraController,
    required this.foco,
    required this.autoFoco,
  });
  @override
  SenhaMascaraState createState() => SenhaMascaraState();
}

class SenhaMascaraState extends State<SenhaMascara> {
  late bool _ocultarSenha;
  @override
  void initState() {
    super.initState();
    this._ocultarSenha = true;
  }

  void alternarVisibilidadeSenha() =>
      setState(() => this._ocultarSenha = !this._ocultarSenha);
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: this.textFormField(),
      );
  Widget textFormField() => TextFormField(
        controller: this.widget.senhaMascaraController,
        focusNode: this.widget.foco,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => this.alternarVisibilidadeSenha(),
            icon: Icon(
              this._ocultarSenha ? Icons.visibility : Icons.visibility_off,
              color: this._ocultarSenha ? Colors.blue : Colors.grey,
            ),
          ),
          border: OutlineInputBorder(),
          labelText: 'senha',
          hintText: 'informe sua senha',
        ),
        validator: (valor) => valor!.length < 8
            ? 'informe: senha com 8 ou mais caracteres.'
            : null,
        obscureText: this._ocultarSenha,
      );
}
