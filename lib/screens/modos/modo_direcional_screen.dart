import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';

class DirecionalPage extends StatefulWidget {
    const DirecionalPage({super.key});

    @override
    State<DirecionalPage> createState() => _DirecionalPageState();

}

class _DirecionalPageState extends State<DirecionalPage> {
  bool isDirecionalOn = false;

  @override
  Widget build(BuildContext context) {
    if(isDirecionalOn == false){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modo Direcional', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
          Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * -0.02,
                  child: Container(
                    width: 400,
                    height: 150,
        
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                ImageIcon(
                                  AssetImage('assets/icons/direcional.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                QuirbyButton(
                                    text: 'Acionar Modo Direcional',
                                    width: 250,
                                    action: () => {print('Ativando modo Direcional'),
                                    isDirecionalOn =true,
                                    }
                                ),
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
                          ]),
                    ),
                  )),
        ]),
      ),
    );
    } else{
      return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Modo Direcional', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
                backgroundColor: Colors.white,
              ),
              body: Stack(
                children: [
                Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * -0.02,
                        child: Container(
                          width: 400,
                          height: 150,
              
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      ImageIcon(
                                        AssetImage('assets/icons/direcional.png'),
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      QuirbyButton(
                                          text: 'Desligar Modo Direcional',
                                          width: 250,
                                          action: () => {print('Desligando modo Direcional'),
                                          isDirecionalOn =false,
                                          }
                                      ),
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
                                    width: 10,
                                  ),
                                ]),
                          ),
                        )),
              ]),
            ),
          );
    }

  }

}