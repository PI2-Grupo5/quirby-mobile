import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';


class ModosPage extends StatelessWidget {
  const ModosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Funcionamento', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
          Positioned(
              top:  MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * -0.050,
              child: SizedBox(
                width: 400,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: QuirbyButton(
                              text: 'Modo Aleatório',
                              width: 250,
                              action: () => {
                                Navigator.pushNamed(
                                  context, '/modo-aleatorio')
                                }),
                        )
                      ]),
              ),
            )),
          Positioned(
              top:  MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * -0.050,
              child: SizedBox(
                width: 400,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: QuirbyButton(
                              text: 'Modo Direcional',
                              width: 250,
                              action: () => {                              
                                Navigator.pushNamed(context, '/modo-direcional')}),
                        )
                      ]),
              ),
            )),
          Positioned(
              top:  MediaQuery.of(context).size.height * 0.3,
              left: MediaQuery.of(context).size.width * -0.050,
              child: SizedBox(
                width: 400,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: QuirbyButton(
                              text: 'Agendamento de Limpeza',
                              width: 250,
                              action: () => {                              
                                Navigator.pushNamed(context, '/agendamento')}),                        )
                      ]),
              ),
            )),
        ]),
      ),
    );
  }
}
