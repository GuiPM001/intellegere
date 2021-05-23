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
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 230,
                ),
              ),
              Input(
                  controller: login,
                  obscure: false,
                  hintText: 'Nome de usuário'),
              SizedBox(height: 20),
              Input(controller: password, obscure: true, hintText: 'Senha'),
              SizedBox(height: 40),
              LoginButton(
                press: () {
                  Navigator.pushNamed(context, '/game_list');
                },
              ),
              SizedBox(height: 40),
              Text('Não tem conta ainda?',
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
          )
        ],
      ),
    ));
  }
}
