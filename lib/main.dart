import 'package:flutter/material.dart';
import 'package:quirby_app/screens/home/home_screen.dart';
import 'package:quirby_app/screens/modos/modos_screen.dart';
import 'package:quirby_app/screens/perfil/perfil_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Quirby';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndexPage = 1;

  final List<Widget> _pageList = <Widget>[
    const PerfilPage(),
    const HomePage(),
    const ModosPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageList.elementAt(_selectedIndexPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(134, 71, 152, 1),
        unselectedItemColor: Color.fromARGB(204, 174, 238, 164),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/quirby.png'),
              radius: 14,
              backgroundColor: Colors.white,
            ),
            label: 'Modos de Uso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndexPage,
        onTap: _onItemTapped,
      ),
    );
  }
}
