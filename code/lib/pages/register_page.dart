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
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text('CADASTRO',
                      style: TextStyle(
                        color: Color(0XFFFF9700),
                        fontFamily: 'Nunito',
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.black26,
                          ),
                        ],
                      )),
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
      return 'CAMPO OBRIGATÓRIO';
    }
    return null;
  }

  String isValidAge(value) {
    if (value == null || value.isEmpty) {
      return 'CAMPO OBRIGATÓRIO';
    }
    return null;
  }

  String isValidGender(value) {
    if (value == null || value.isEmpty) {
      return 'CAMPO OBRIGATÓRIO';
    }
    return null;
  }

  String isValidPassword(value) {
    if (value == null || value.isEmpty) {
      return 'CAMPO OBRIGATÓRIO';
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
