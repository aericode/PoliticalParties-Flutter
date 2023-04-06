import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
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
                decoration: InputDecoration(label: Text('Password'))),
            ElevatedButton(child: const Text('Cadastrar'), onPressed: () => {}),
          ],
        ));
  }
}
