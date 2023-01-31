import 'package:flutter/material.dart';

class AjudaPage extends StatelessWidget {
  const AjudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ajuda', style: TextStyle(color: Color(0xff87986A))),
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
              "O Quirby é um robô aspirador que foi projetado para oferecer uma limpeza completa e conveniente para sua casa. Ele possui dois modos de limpeza: o modo aleatório e o modo direcional.\nNo modo aleatório, o Quirby é movido pelo cliente utilizando seu celular por meio do nosso aplicativo mobile. Além disso, o Quirby possui um modo de agendamento de limpeza, onde você pode programar a limpeza para acontecer em momentos específicos do dia, enquanto você não estiver em casa. Com seus sensores de obstáculos e tecnologia de navegação, o Quirby é capaz de evitar obstáculos e limpar com precisão, garantindo que sua casa esteja sempre limpa e fresca.\n\nConexão Via Wifi: ...\n\nConexão via Bluetooth:......."),
        ),
      ),
    );
  }
}
