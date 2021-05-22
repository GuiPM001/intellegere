import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/input.dart';
import '../components/register_button.dart';
import '../components/return_button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();

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
                padding: EdgeInsets.only(bottom: 80),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 230,
                ),
              ),
              Input(
                  controller: login,
                  obscure: false,
                  hintText: 'Nome de Usuário'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextFormField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 0, bottom: 5, // HERE THE IMPORTANT PART
                          ),
                          hintText: 'Idade',
                          hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 18,
                              color: Color(0XFF616161),
                              fontWeight: FontWeight.w700),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 180,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextFormField(
                      controller: gender,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 0, bottom: 5, // HERE THE IMPORTANT PART
                          ),
                          hintText: 'Sexo',
                          hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 18,
                              color: Color(0XFF616161),
                              fontWeight: FontWeight.w700),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Input(controller: password, obscure: true, hintText: 'Senha'),
              SizedBox(height: 40),
              RegisterButton(press: () {
                Navigator.pushNamed(context, '/game_list');
              })
            ],
          )
        ],
      ),
    ));
  }
}
