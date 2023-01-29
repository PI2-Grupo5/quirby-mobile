import 'package:flutter/material.dart';

class InformacaoPage extends StatelessWidget {
  const InformacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Informações do Quirby', style: TextStyle(color: Color(0xff87986A))),
          backgroundColor: Colors.white,
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Text(
            "Número de Série: *****\nControle de Acesso: *****"),
        ),
      ),
    );
  }
}
