import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                AssetImage('assets/icons/bluetoothLigado.png'),
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
                            children: const [
                              ImageIcon(
                                AssetImage('assets/icons/bateria.png'),
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('40%', style: TextStyle(fontSize: 20)),
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
                            children: const [
                              ImageIcon(
                                AssetImage('assets/icons/aleatorio.png'),
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Modo Aleatorio',
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(
                                width: 15,
                              ),
                              Text('OFF',
                                  style: TextStyle(
                                    fontSize: 20,
                                    backgroundColor: Colors.red,
                                    color: Colors.black,
                                  )),
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
                    text: 'TESTANDO BOTAO',
                    width: 350,
                    buttonIcon: const ImageIcon(
                      AssetImage('assets/icons/aleatorio.png'),
                      color: Colors.green,
                    ),
                    action: () => {print('To funcionando')}))
          ]),
        ));
  }
}
