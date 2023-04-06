import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:political_parties_brazil/login_page.dart';

import 'home_page.dart';

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({super.key});

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Você não tem usuário logado.');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        print('Usuário logado.');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }
    });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
