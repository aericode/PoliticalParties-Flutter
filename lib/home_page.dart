import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:political_parties_brazil/sobre.dart';

import 'checagem_page.dart';
import 'filiados.dart';
import 'listaPartidos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Inicial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChecagemPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';
  String userId = '';

  @override
  initState() {
    super.initState();
    pegarUsuario();
  }

  pegarUsuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        print(usuario.displayName);
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }

    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.length > 0) {
        // Extrair o ID do primeiro documento que satisfaça a query
        setState(() {
          userId = querySnapshot.docs[0].id;
        });
      }
    });
  }

  sair() async {
    await _firebaseAuth.signOut().then((user) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChecagemPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidos'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                sair();
              },
              child: const Icon(
                Icons.exit_to_app,
                size: 26.0,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
                height: 150.0,
                child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Text(
                          nome,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ))),
            ListTile(
              title: const Text('Consultar filiados'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FiliadosPartidoPage()));
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SobrePage()));
              },
            ),
          ],
        ),
      ),
      body: ListaPartidos(
          title: "Patidos", nome: nome, email: email, userId: userId),
    );
  }
}
