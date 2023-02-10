import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:quirby_app/components/button.dart';

class DirecionalPage extends StatefulWidget {
  final bool checkAvailability;
  const DirecionalPage({super.key, required this.checkAvailability});

  @override
  State<DirecionalPage> createState() => _DirecionalPageState();
}

enum _DeviceAvailability {
  no,
  maybe,
  yes,
}

class _DeviceWithAvailability {
  BluetoothDevice device;
  _DeviceAvailability availability;
  int? rssi;

  _DeviceWithAvailability(this.device, this.availability, [this.rssi]);
}

class _DirecionalPageState extends State<DirecionalPage> {
  bool isDirecionalOn = true;
  List<_DeviceWithAvailability> devices =
      List<_DeviceWithAvailability>.empty(growable: true);
  BluetoothConnection? connection;
  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);
  late BluetoothDevice quirby;
  bool isDisconnecting = false;

  // Availability
  StreamSubscription<BluetoothDiscoveryResult>? _discoveryStreamSubscription;
  bool _isDiscovering = false;

  _DirecionalPageState();

  @override
  void initState() {
    super.initState();

    _isDiscovering = true;

    if (_isDiscovering) {
      _startDiscovery();
    }

    // Setup a list of the bonded devices
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
      setState(() {
        devices = bondedDevices
            .map(
              (device) => _DeviceWithAvailability(
                device,
                widget.checkAvailability
                    ? _DeviceAvailability.maybe
                    : _DeviceAvailability.yes,
              ),
            )
            .toList();
      });
    });
  }

  void _restartDiscovery() {
    setState(() {
      _isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        Iterator i = devices.iterator;
        while (i.moveNext()) {
          var _device = i.current;
          if (_device.device == r.device) {
            _device.availability = _DeviceAvailability.yes;
            _device.rssi = r.rssi;
          }
        }
      });
    });

    _discoveryStreamSubscription?.onDone(() {
      setState(() {
        _isDiscovering = false;
      });

      print("Aparelhos pareados ====>");
      devices.forEach((element) {
        print("${element.device.name}");
        if (element.device.name == "Quirby") {
          setState(() {
            quirby = element.device;
          });
          _conectToQuirby();
        }
      });
    });
  }

  _conectToQuirby() {
    BluetoothConnection.toAddress(quirby.address).then((_connection) {
      print('Connected to the device ');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection!.input!.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _discoveryStreamSubscription?.cancel();

    super.dispose();
  }

  void _onDataReceived(Uint8List data) {
    print("Ta entrando no ondatareceived");
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
  }

  void _sendMessage(String direction) async {
    direction = direction.trim();

    if (direction.length > 0) {
      try {
        connection!.output
            .add(Uint8List.fromList(utf8.encode(direction + "\r\n")));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isDirecionalOn == false) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Modo Direcional',
                style:
                    TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leadingWidth: 70,
            leading: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_sharp, color: Color(0xff87986A)),
              label: const Text(''),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          body: Stack(children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * -0.02,
                child: Container(
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                                  action: () => {
                                        print('Ativando modo Direcional'),
                                        isDirecionalOn = true,
                                      }),
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
    } else {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Modo Direcional',
                style:
                    TextStyle(color: Color(0xff87986A), fontFamily: 'Schyler')),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leadingWidth: 70,
            leading: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_sharp, color: Color(0xff87986A)),
              label: const Text(''),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          body: Stack(children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * -0.02,
                child: Container(
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                                  action: () => {
                                        print('Desligando modo Direcional'),
                                        isDirecionalOn = false,
                                      }),
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
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
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
                                icon: Icon(Icons.arrow_circle_up,
                                    color: Color(0xff81D460)),
                                iconSize: 100.0,
                                onPressed: () {
                                  _sendMessage("1");
                                  print('Frente');
                                }),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.arrow_circle_left_outlined,
                                      color: Color(0xff81D460)),
                                  iconSize: 100.0,
                                  onPressed: () {
                                    _sendMessage("4");
                                    print('Esquerda');
                                  }),
                              const SizedBox(width: 80),
                              IconButton(
                                  icon: Icon(Icons.arrow_circle_right_outlined,
                                      color: Color(0xff81D460)),
                                  iconSize: 100.0,
                                  onPressed: () {
                                    _sendMessage("2");
                                    print('Direita');
                                  }),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: IconButton(
                                icon: Icon(Icons.arrow_circle_down,
                                    color: Color(0xff81D460)),
                                iconSize: 100.0,
                                onPressed: () {
                                  _sendMessage("2");
                                  print('Volta');
                                }),
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
