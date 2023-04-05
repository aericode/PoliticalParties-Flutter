import 'package:flutter/material.dart';

class CadastroCandidato extends StatefulWidget {
  @override
  _CadastroCandidatoState createState() => _CadastroCandidatoState();
}

class _CadastroCandidatoState extends State<CadastroCandidato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Candidato'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Data de nascimento',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Partido político',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}