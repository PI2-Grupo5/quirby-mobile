import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quirby_app/components/button.dart';
import 'package:quirby_app/requests.dart';

final _formKey = GlobalKey<FormState>();


class AgendamentoPage extends StatefulWidget {
    const AgendamentoPage({super.key});

    @override
    State<AgendamentoPage> createState() => _AgendamentoPageState();

}

class _AgendamentoPageState extends State<AgendamentoPage> {
  var _value = '-1';
  var _valueDuration = '-1';
  bool? repetirSemanalmente = false;
  String? tempo = null;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 18, minute: 00);

  void _showTimePicker() {
    showTimePicker(context: context,
    initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agendamento de Limpeza', style: TextStyle(color: Color(0xff87986A))),
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
                    DropdownButtonFormField(
                      value: '-1',
                      items: [
                        DropdownMenuItem(child:Text('-Selecione o dia da semana-'), value: '-1'),
                        DropdownMenuItem(child:Text('Segunda-feira'), value: '1'),
                        DropdownMenuItem(child:Text('Terça-feira'), value: '2'),
                        DropdownMenuItem(child:Text('Quarta-feira'), value: '3'),
                        DropdownMenuItem(child:Text('Quinta-feira'), value: '4'),
                        DropdownMenuItem(child:Text('Sexta-feira'), value: '5'),
                        DropdownMenuItem(child:Text('Sábado'), value: '6'),
                        DropdownMenuItem(child:Text('Domingo'), value: '7'),
                      ],
                      onChanged: (valueDay) {
                        _value = valueDay!;
                        print(_value);
                      },
                    ),
                      SizedBox(
                        height: 30,
                      ),
                    Row(
                      children: [
                        MaterialButton(
                            onPressed: _showTimePicker,
                            child: Text('Escolha a hora',
                                style: TextStyle(color: Colors.white, fontSize:15)),
                                color: Color(0xff81D460),
                      ),
                        SizedBox(
                         width: 30,
                        ),
                        Text(_timeOfDay.format(context).toString(), style: TextStyle(fontSize: 20),),
                      ]
                    ),
                      SizedBox(
                        height: 20,
                      ),
                    DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(child:Text('-Selecione o tempo de Funcionamento-'), value: '-1'),
                        DropdownMenuItem(child:Text('00:05'), value: '5'),
                        DropdownMenuItem(child:Text('00:10'), value: '10'),
                        DropdownMenuItem(child:Text('00:15'), value: '15'),
                        DropdownMenuItem(child:Text('00:20'), value: '20'),
                        DropdownMenuItem(child:Text('00:25'), value: '25'),
                        DropdownMenuItem(child:Text('00:30'), value: '30'),
                      ],
                      onChanged: (v) {
                        _valueDuration = v!;
                        print(_valueDuration);
                      },
                    ),
                   SizedBox(
                       height: 30,
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff81D460),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Convert the day of week to a DateTime object representing the next occurrence of that day
                      DateTime nextOccurrence = DateTime.now();
                      while (nextOccurrence.weekday != int.parse(_value)) {
                        nextOccurrence = nextOccurrence.add(Duration(days: 1));
                      }

                      // Combine the date with the time of day to get the final date and time
                      DateTime dateAndTime = DateTime(
                        nextOccurrence.year,
                        nextOccurrence.month,
                        nextOccurrence.day,
                        _timeOfDay.hour,
                        _timeOfDay.minute,
                      );

                      DateTime endDateAndTime = dateAndTime.add(Duration(minutes: int.parse(_valueDuration)));

                      // Convert the final date and time to a string in ISO 8601 format
                      String iso8601String = dateAndTime.toIso8601String();
                      String iso8601Duration = endDateAndTime.toIso8601String();
                      
                      print(iso8601String);
                      print(iso8601Duration);

                      List<String> cleaningSchedule = [iso8601String, iso8601Duration];
                      updateCleaningSchedule(cleaningSchedule);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Great!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Confirmar'),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Limpezas Agendadas', style: TextStyle(fontSize: 20, color: Color(0xff87986A), fontWeight: FontWeight.bold)),
                ]
            )
          )
        ),
      ),
    );
  }
}


