import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellegere/components/input.dart';
import 'package:intellegere/components/login_button.dart';
import 'package:intellegere/components/register_button.dart';
import 'package:intellegere/components/return_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  child: Text('L O G I N',
                      style: TextStyle(
                        color: Color(0XFFFF0000),
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
                    hintText: 'Nome de usu??rio'),
                SizedBox(height: 20),
                Input(
                    keyboardType: TextInputType.text,
                    validator: isValidPassword,
                    obscure: true,
                    hintText: 'Senha'),
                SizedBox(height: 40),
                LoginButton(
                  press: () {
                    logIn();
                  },
                ),
                SizedBox(height: 40),
                Text('N??o tem conta ainda?',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: Color(0XFF282726),
                        fontWeight: FontWeight.w800)),
                RegisterButton(
                  press: () {
                    Navigator.pushNamed(context, '/register_page');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  String isValidName(value) {
    if (value == null || value.isEmpty) {
      return 'CAMPO OBRIGAT??RIO';
    }
    return null;
  }

  String isValidPassword(value) {
    if (value == null || value.isEmpty) {
      return 'CAMPO OBRIGAT??RIO';
    }
    return null;
  }

  logIn() {
    if (formKey.currentState.validate()) {
      Navigator.pushNamed(context, '/game_list', arguments: {'logged': true});
    } else
      return null;
  }
}
