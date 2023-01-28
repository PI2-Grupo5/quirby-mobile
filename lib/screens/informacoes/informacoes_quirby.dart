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
              "O Quirby é um robô aspirador que foi projetado para oferecer uma limpeza completa e conveniente para sua casa. Ele possui dois modos de limpeza: o modo aleatório e o modo direcional. No modo aleatório, o Quirby é movido pelo cliente utilizando seu celular por meio do nosso aplicativo mobile. Além disso, o Quirby possui um modo de agendamento de limpeza, onde você pode programar a limpeza para acontecer em momentos específicos do dia, enquanto você não estiver em casa. Com seus sensores de obstáculos e tecnologia de navegação, o Quirby é capaz de evitar obstáculos e limpar com precisão, garantindo que sua casa esteja sempre limpa e fresca."),
        ),
      ),
    );
  }
}
