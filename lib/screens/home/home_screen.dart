import 'package:flutter/material.dart';
import 'package:quirby_app/components/button.dart';
import 'package:quirby_app/requests.dart';
import 'dart:core';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSigned = true;

  @override
  Widget build(BuildContext context) {
    if (isSigned == true) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: const Color(0xfff5f5f3),
            body: Stack(children: [
              Positioned(
                  top: 100,
                  left: 20,
                  child: Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                ImageIcon(
                                  AssetImage('assets/icons/ligado.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Ligado', style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: const [
                                ImageIcon(
                                  AssetImage(
                                      'assets/icons/bluetoothLigado.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Conectado via Bluetooth',
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: const [
                                ImageIcon(
                                  AssetImage('assets/icons/wifiOff.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Sem conexão com Wifi',
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                FutureBuilder<Map<String, dynamic>>(
                                  future: getDeviceInfo(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Map<String, dynamic>? deviceInfo = snapshot.data;
                                      return Row(
                                        children: [
                                          ImageIcon(
                                            AssetImage('assets/icons/bateria.png'),
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('${deviceInfo!['batteryStatus']}%', style: TextStyle(fontSize: 20)),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ]),
                    ),
                  )),
              Positioned(
                  top: 320,
                  left: 20,
                  child: Container(
                    width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<Map<String, dynamic>>(
                                  future: getDeviceInfo(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Map<String, dynamic>? deviceInfo = snapshot.data;
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ImageIcon(
                                            AssetImage('assets/icons/aleatorio.png'),
                                            color: deviceInfo!['functionMode'] == 'Aleatorio' ? Colors.green : Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Modo Aleatório',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            deviceInfo!['functionMode'] == 'Aleatorio' ? 'ON' : 'OFF',
                                            style: TextStyle(
                                              fontSize: 20,
                                              backgroundColor: deviceInfo!['functionMode'] == 'Aleatorio' ? Colors.green : Colors.red,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                ImageIcon(
                                  AssetImage('assets/icons/direcional.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Modo Direcional',
                                    style: TextStyle(fontSize: 20)),
                                SizedBox(
                                  width: 15,
                                ),
                                Text('ON',
                                    style: TextStyle(
                                      fontSize: 20,
                                      backgroundColor: Colors.green,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ]),
                    ),
                  )),
              Positioned(
                  top: 500,
                  left: 50,
                  child: QuirbyButton(
                      text: 'Conectar com o Bluetooth',
                      width: 350,
                      action: () => {print('To funcionando')})),
              Positioned(
                  top: 500,
                  left: 50,
                  child: QuirbyButton(
                      text: 'Conectar com o Wifi',
                      width: 350,
                      action: () => {
                        Navigator.pushNamed(context, '/conectar-wifi')})),
            ]),
          ));
    } else {
      return MaterialApp(
        home: Scaffold(
          body: Stack(children: [
            Positioned(
                top: 100,
                left: 20,
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Login'),
                          const SizedBox(height: 10),
                          Center(
                            child: QuirbyButton(
                                text: 'Entrar com o Google',
                                width: 250,
                                buttonIcon: const CircleAvatar(
                                  radius: 14,
                                  backgroundImage:
                                      AssetImage('assets/icons/google.png'),
                                ),
                                action: () => {print('Entrando com o google')}),
                          )
                        ]),
                  ),
                )),
            Positioned(
                top: 250,
                left: 20,
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cadastrar'),
                          const SizedBox(height: 10),
                          Center(
                            child: QuirbyButton(
                                text: 'Cadastrar com o Google',
                                width: 250,
                                buttonIcon: const CircleAvatar(
                                  radius: 14,
                                  backgroundImage:
                                      AssetImage('assets/icons/google.png'),
                                ),
                                action: () =>
                                    {print('Cadastrando com o google')}),
                          )
                        ]),
                  ),
                )),
            Positioned(
                top: 600,
                left: 20,
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: QuirbyButton(
                                text: 'Termos de Uso e Privacidade',
                                width: 400,
                                action: () => {
                                      Navigator.pushNamed(
                                          context, '/termos-uso')
                                    }),
                          )
                        ]),
                  ),
                )),
          ]),
        ),
      );
    }
  }
}
