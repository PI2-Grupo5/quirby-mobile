import 'package:flutter/material.dart';
import 'package:quirby_app/screens/home/home_screen.dart';
import 'package:quirby_app/screens/modos/agendamento_screen.dart';
import 'package:quirby_app/screens/modos/modos_screen.dart';
import 'package:quirby_app/screens/modos/modo_aleatorio_screen.dart';
import 'package:quirby_app/screens/modos/modo_direcional_screen.dart';
import 'package:quirby_app/screens/perfil/perfil_screen.dart';
import 'package:quirby_app/screens/termosUso/termos_uso.screen.dart';
import 'package:quirby_app/screens/informacoes/informacoes_quirby.dart';
import 'package:quirby_app/screens/informacoes/ajuda.dart';
import 'package:quirby_app/screens/conexao/wifi_screen.dart';

import 'dart:async';
import 'dart:convert' show json;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>['email'],
);

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const String _title = 'Quirby';
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static const String _title = 'Quirby';
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        Navigator.pushNamed(context, '/agendamento');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return MaterialApp(
          title: _title,
          routes: {
            '/termos-uso': (_) => const TermosDeUso(),
            '/homepage': (_) => const HomePage(),
            '/modo-aleatorio': (_) => const AleatorioPage(),
            '/modo-direcional': (_) => const DirecionalPage(),
            '/informacoes-quirby': (_) => const InformacaoPage(),
            '/ajuda': (_) => const AjudaPage(),
            '/conectar-wifi': (_) => const WifiPage(),
            '/agendamento': (_) => const AgendamentoPage(),
          },
          home: Scaffold(
              body: const HomePage(),
              bottomNavigationBar: const MyStatefulWidget()));
      //return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      //  children: <Widget>[
      //    ListTile(
      //      leading: GoogleUserCircleAvatar(
      //        identity: user,
      //      ),
      //      title: Text(user.displayName ?? ''),
      //      subtitle: Text(user.email),
      //    ),
      //    const Text('Signed in successfully.'),
      //    Text(_contactText),
      //    ElevatedButton(
      //      onPressed: _handleSignOut,
      //      child: const Text('SIGN OUT'),
      //    )
      //  ],
      //);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          ElevatedButton(
            onPressed: _handleSignIn,
            child: const Text('SIGN IN'),
          ),
        ],
      );
    }
  }

  //@override
  //Widget build(BuildContext context) {
  //  return MaterialApp(

  //  );
  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        //routes: {
        //  '/termos-uso': (_) => const TermosDeUso(),
        //  '/homepage': (_) => const HomePage(),
        //  '/modo-aleatorio': (_) => const AleatorioPage(),
        //  '/modo-direcional': (_) => const DirecionalPage(),
        //  '/informacoes-quirby': (_) => const InformacaoPage(),
        //  '/ajuda': (_) => const AjudaPage(),
        //  '/conectar-wifi': (_) => const WifiPage(),
        //  '/agendamento': (_) => const AgendamentoPage(),
        //},
        home: Scaffold(
            body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        )));
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
    const ModosPage(),
    const HomePage(),
    const PerfilPage(),
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
