import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'checagem_page.dart';
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
              title: const Text('Cadastrar partido'),
              onTap: () {
                // Adicione o código para navegar para a tela de cadastro de partido aqui
              },
            ),
            ListTile(
              title: const Text('Filiar político'),
              onTap: () {
                // Adicione o código para navegar para a tela de filiação de político aqui
              },
            ),
          ],
        ),
      ),
      body: const ListaPartidos(
        title: "Patidos",
      ),
    );
  }
}
