import 'package:flutter/material.dart';
import 'listaPartidos.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Inicial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
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
      body: Center(
        child: MyHomePage(
          title: "minhaAplicacao"
        )
        ),
    );
  }
}