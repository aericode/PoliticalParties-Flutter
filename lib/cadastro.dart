import 'package:flutter/material.dart';

class CadastroCandidato extends StatefulWidget {
  const CadastroCandidato({super.key});

  @override
  _CadastroCandidatoState createState() => _CadastroCandidatoState();
}

class _CadastroCandidatoState extends State<CadastroCandidato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Candidato'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Data de nascimento',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Partido político',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
