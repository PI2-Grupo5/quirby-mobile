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
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon:  Icon(Icons.arrow_back_sharp, color: Color(0xff87986A)),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
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
