import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Autenticacao extends StatefulWidget {
  @override
  _AutenticacaoState createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao>{
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    @override
    void initState() {
        super.initState();
        _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
            if (account != null) {
                print("Nome do usuário: ${account.displayName}");
                print("Email do usuário: ${account.email}");
            } else {
                print("Não há usuário logado");
            }
        });
        _googleSignIn.signInSilently();   
    }
    
    Future<void> _loginWithGoogle() async {
        try {
            await _googleSignIn.signIn();
        } catch (error) {
            print("Erro ao fazer login com o Google: $error");
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: ElevatedButton(
                    onPressed: _loginWithGoogle,
                    child: Text("Fazer login com o Google"),
                ),
            ),
        );
    }

}