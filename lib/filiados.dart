import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FiliadosPartidoPage extends StatefulWidget {
  const FiliadosPartidoPage({super.key});

  @override
  _FiliadosPartidoPageState createState() => _FiliadosPartidoPageState();
}

class _FiliadosPartidoPageState extends State<FiliadosPartidoPage> {
  TextEditingController partidoController = TextEditingController();
  List<String> userIds = [];
  List<String> nomeFiliados = [];
  late String documentoId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filiados por partido'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: partidoController,
              decoration: const InputDecoration(
                labelText: 'Número do partido',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Buscar filiados'),
              onPressed: () {
                buscarFiliados();
              },
            ),
            SizedBox(height: 16.0),
            Text('Filiados ao partido ${partidoController.text}:'),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: nomeFiliados.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(nomeFiliados[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buscarFiliados() async {
    await FirebaseFirestore.instance
        .collection('partidos')
        .where('numero', isEqualTo: partidoController.text)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.length > 0) {
        // Extrair o ID do primeiro documento que satisfaça a query
        setState(() {
          documentoId = querySnapshot.docs[0].id;
        });
      }
    });

    await FirebaseFirestore.instance
        .collection('partidos')
        .doc(documentoId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (!documentSnapshot.exists) {
        // Partido não encontrado
        return;
      }

      // Lista de usuários filiados ao partido
      List<String> ids = List<String>.from(documentSnapshot.get('afiliados'));

      setState(() {
        userIds = ids;
      });
    }).catchError((error) {
      // Tratar erros
    });

    List<String> nomes = [];
    for (var userId in userIds) {
      if (userId != '' && userId.isNotEmpty) {
        print(userId);
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) {
            print('****************** Entra aqui ******************* ');
            return;
          }
          nomes.add(documentSnapshot.get('nome'));
        });
      }
    }

    setState(() {
      nomeFiliados = nomes;
    });
  }
}
