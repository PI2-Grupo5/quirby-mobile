import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';


class AleatorioPage extends StatefulWidget {
    const AleatorioPage({super.key});

    @override
    State<AleatorioPage> createState() => _AleatorioPageState();

}

class _AleatorioPageState extends State<AleatorioPage> {
  bool isAleatorioOn = false;

  @override
  Widget build(BuildContext context) {
    if(isAleatorioOn == false){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modo Aleatório', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
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
                                  AssetImage('assets/icons/aleatorio.png'),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                QuirbyButton(
                                    text: 'Acionar Modo Aleatório',
                                    width: 250,
                                    action: () => {print('Ativando modo Aleatório'),
                                    isAleatorioOn =true,
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
                title: const Text('Modo Aleatório', style: TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
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
                                        AssetImage('assets/icons/aleatorio.png'),
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      QuirbyButton(
                                          text: 'Desligar Modo Aleatório',
                                          width: 250,
                                          action: () => {print('Desligando modo Aleatório'),
                                          isAleatorioOn =false,
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

  

