import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:political_parties_brazil/cadastro_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(label: Text('E-mail')),
            ),
            TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(label: Text('Senha'))),
            ElevatedButton(
                child: const Text('Entrar'), onPressed: () => login()),
            ElevatedButton(
                child: const Text('Criar conta'), onPressed: () => signin())
          ],
        ));
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Usuario não encontrado'),
            backgroundColor: Colors.redAccent));
      } else if (e.code == 'wrong-password') {
        const SnackBar(
          content: Text('Sua senha está errada'),
          backgroundColor: Colors.redAccent,
        );
      }
    }
  }

  signin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CadastroPage()));
  }
}
