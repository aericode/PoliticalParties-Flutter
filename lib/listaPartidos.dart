import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'info.dart' as info;

class ListaPartidos extends StatefulWidget {
  const ListaPartidos(
      {super.key,
      required this.title,
      required this.nome,
      required this.email,
      required this.userId});

  final String title;
  final String nome;
  final String email;
  final String userId;

  @override
  State<ListaPartidos> createState() => _ListaPartidosState();
}

class _ListaPartidosState extends State<ListaPartidos> {
  int _counter = 0;

  static const int PARTY_COUNT = 31;

  String documentoId = '';

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter = _counter % PARTY_COUNT;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _counter = _counter % PARTY_COUNT;
    });
  }

  String getDisplayName(partyEntry) {
    String displayName;
    if (partyEntry[1] == "—") {
      displayName = partyEntry[0];
    } else {
      displayName = partyEntry[1];
    }

    return displayName;
  }

  String getPartyLogoPath(partyEntry) {
    String fileName = getDisplayName(partyEntry);
    String fullPath = "assets/logos/$fileName.png";

    return fullPath;
  }

  filiar() async {
    await FirebaseFirestore.instance
        .collection('partidos')
        .where('numero', isEqualTo: info.info_array[_counter][2])
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.length > 0) {
        // Extrair o ID do primeiro documento que satisfaça a query
        setState(() {
          documentoId = querySnapshot.docs[0].id;
        });
      }
    });

    FirebaseFirestore.instance
        .collection('partidos')
        .doc(documentoId)
        .update({
          'afiliados': FieldValue.arrayUnion([widget.userId])
        })
        .then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Usuário filiado com sucesso.'),
                  backgroundColor: Colors.green))
            })
        .catchError((err) => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error: $err'),
                  backgroundColor: Colors.redAccent))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 45, 0, 40),
            child: Image.asset(
              getPartyLogoPath((info.info_array[_counter])),
              height: 180,
            ),
          ),
          Column(
            children: [
              Text("${info.info_array[_counter][0]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Sigla: ${info.info_array[_counter][1]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Número Eleitoral: ${info.info_array[_counter][2]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Data de criação: ${info.info_array[_counter][4]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  "Data de registro definintivo: ${info.info_array[_counter][5]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Presidente atual: ${info.info_array[_counter][6]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              ElevatedButton(
                  onPressed: () => filiar(), child: Text('Filiar-se'))
            ],
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 44),
                  onPressed: _decrementCounter,
                ),
                const Spacer(),
                Text(getDisplayName(info.info_array[_counter]),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32)),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 44),
                    onPressed: _incrementCounter),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
