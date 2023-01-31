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
  bool isDirecionalOn = true;

  @override
  Widget build(BuildContext context) {
    if(isDirecionalOn == false){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modo Direcional', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
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
        body: Stack(
          children: [
          Positioned(
                  top: MediaQuery.of(context).size.height * 0.02,
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
              body: Stack(
                children: [
                Positioned(
                        top: MediaQuery.of(context).size.height * 0.02,
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
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.width * 0.05,
                    child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
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
                )
            ),
              Positioned(
              top:  MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * -0.05,
              child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: IconButton(
                            icon: Icon(Icons.arrow_circle_up, color: Color(0xff81D460)),
                            iconSize: 100.0,
                            onPressed: () {print('Frente');}
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_circle_left_outlined, color: Color(0xff81D460)),
                              iconSize: 100.0,
                              onPressed: () {print('Esquerda');}
                            ),
                            const SizedBox(width: 80),
                            IconButton(
                              icon: Icon(Icons.arrow_circle_right_outlined, color: Color(0xff81D460)),
                              iconSize: 100.0,
                              onPressed: () {print('Direita');}
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                          Center(
                          child: IconButton(
                            icon: Icon(Icons.arrow_circle_down, color: Color(0xff81D460)  ),
                            iconSize: 100.0,
                            onPressed: () {print('Volta');}
                          ),
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