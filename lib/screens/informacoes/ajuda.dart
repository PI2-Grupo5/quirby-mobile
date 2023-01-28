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
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Text(
              "Conexão Bluetooth: *****. Conexão WiFi: *****"),
        ),
      ),
    );
  }
}
