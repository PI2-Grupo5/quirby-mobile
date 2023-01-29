import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';

final _formKey = GlobalKey<FormState>();


class AgendamentoPage extends StatefulWidget {
    const AgendamentoPage({super.key});

    @override
    State<AgendamentoPage> createState() => _AgendamentoPageState();

}

class _AgendamentoPageState extends State<AgendamentoPage> {
  var _value= '-1';
  bool? repetirSemanalmente = false;
  String? tempo = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agendamento de Limpeza', style: TextStyle(color: Color(0xff87986A))),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
                children: [
                    DropdownButtonFormField(
                      value: _value,
                      items: [
                        DropdownMenuItem(child:Text('-Selecione o dia da semana-'), value: '-1'),
                        DropdownMenuItem(child:Text('Segunda-feira'), value: '1'),
                        DropdownMenuItem(child:Text('Terça-feira'), value: '2'),
                        DropdownMenuItem(child:Text('Quarta-feira'), value: '3'),
                        DropdownMenuItem(child:Text('Quinta-feira'), value: '4'),
                        DropdownMenuItem(child:Text('Sexta-feira'), value: '5'),
                        DropdownMenuItem(child:Text('Sábado'), value: '6'),
                        DropdownMenuItem(child:Text('Domingo'), value: '7'),
                        DropdownMenuItem(child:Text('Todos os dias'), value: '8'),
                      ],
                      onChanged: (v) {},
                    ),
                    TextFormField(
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(hintText: 'Horário de Funcionamento'),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Digite o SSD do WiFi';
                            }
                            return null;
                        }
                    ),
                    TextFormField(
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(hintText: 'Tempo de funcionamento em minutos'),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Digite o tempo';
                            }
                            return tempo;
                        }
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: repetirSemanalmente,
                          onChanged: (bool? checked) {
                            setState(() {
                              print(checked);
                              repetirSemanalmente = checked;
                            });
                          },
                        ),
                      Text('Repetir Semanalmente'),
                    ],
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


