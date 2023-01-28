import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';


class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perfil', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
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
                              text: 'Termos de Uso e Privacidade',
                              width: 250,
                              action: () => {
                                Navigator.pushNamed(
                                  context, '/termos-uso')
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
                              text: 'Informações do Quirby',
                              width: 250,
                              action: () => {                              
                                Navigator.pushNamed(context, '/informacoes-quirby')}),
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
                              text: 'Ajuda',
                              width: 250,
                              action: () => {                              
                                Navigator.pushNamed(context, '/ajuda')}),
                        )
                      ]),
              ),
            )),
          Positioned(
              top:  MediaQuery.of(context).size.height * 0.4,
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
                              text: 'Sair',
                              width: 250,
                              action: () => {print('Flws')}),
                        )
                      ]),
              ),
            )),
        ]),
      ),
    );
  }
}
