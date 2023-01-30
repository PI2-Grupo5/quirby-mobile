import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class WifiPage extends StatelessWidget {
  const WifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Conectar via Wifi', style: TextStyle(color: Color(0xff87986A))),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
                children: [
                    TextFormField(
                        decoration: new InputDecoration(hintText: 'SSD do WiFi'),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Digite o SSD do WiFi';
                            }
                            return null;
                        }
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(hintText: 'Senha do WiFi'),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Digite senha do WiFi';
                            }
                            return null;
                        }
                    ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff81D460)),
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Great!'),
                                )
                            );
                        }
                    },
                    child: const Text('Confirmar'),
                )
                ]
            )
          )
        ),
      ),
    );
  }
}
