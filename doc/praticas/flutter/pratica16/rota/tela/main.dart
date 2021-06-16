import 'package:flutter/material.dart';
import '../../exercicio3rota.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => PrimeiraTela(),
          '/segunda': (context) => SegundaTela(),
        },
      ),
    );
