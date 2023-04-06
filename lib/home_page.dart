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
  sair() async {
    await _firebaseAuth.signOut().then((user) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChecagemPage())));
  }

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                sair();
              },
              child: Icon(
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
            DrawerHeader(
              child: Text(
                'Opções',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Cadastrar partido'),
              onTap: () {
                // Adicione o código para navegar para a tela de cadastro de partido aqui
              },
            ),
            ListTile(
              title: Text('Cadastrar político'),
              onTap: () {
                // Adicione o código para navegar para a tela de cadastro de político aqui
              },
            ),
            ListTile(
              title: Text('Filiar político'),
              onTap: () {
                // Adicione o código para navegar para a tela de filiação de político aqui
              },
            ),
            ListTile(
              title: Text('Ver partidos'),
              onTap: () {
                // Adicione o código para navegar para a tela de visualização de partidos aqui
              },
            ),
          ],
        ),
      ),
      body: ListaPartidos(
        title: "Patidos",
      ),
    );
  }
}
