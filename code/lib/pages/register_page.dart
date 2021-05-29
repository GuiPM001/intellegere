import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellegere/components/input.dart';
import 'package:intellegere/components/register_button.dart';
import 'package:intellegere/components/return_button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/background-unfocused.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          ReturnButton(
            press: () {
              Navigator.pop(context);
            },
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 80),
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 230,
                  ),
                ),
                Input(
                    keyboardType: TextInputType.text,
                    validator: isValidName,
                    obscure: false,
                    hintText: 'Nome de Usuário'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Input(
                          keyboardType: TextInputType.number,
                          validator: isValidAge,
                          obscure: false,
                          hintText: 'Idade'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Input(
                          keyboardType: TextInputType.text,
                          validator: isValidGender,
                          obscure: false,
                          hintText: 'Sexo'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Input(
                    keyboardType: TextInputType.text,
                    validator: isValidPassword,
                    obscure: true,
                    hintText: 'Senha'),
                SizedBox(height: 40),
                RegisterButton(press: () {
                  register();
                })
              ],
            ),
          )
        ],
      ),
    ));
  }

  String isValidName(value) {
    if (value == null || value.isEmpty) {
      return 'Insira seu nome de usuário';
    }
    return null;
  }

  String isValidAge(value) {
    if (value == null || value.isEmpty) {
      return 'Insira sua idade';
    }
    return null;
  }

  String isValidGender(value) {
    if (value == null || value.isEmpty) {
      return 'Insira seu sexo';
    }
    return null;
  }

  String isValidPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Insira sua senha';
    }
    return null;
  }

  register() {
    if (formKey.currentState.validate()) {
      Navigator.pushNamed(context, '/game_list', arguments: {'logged': true});
    } else
      return null;
  }
}
