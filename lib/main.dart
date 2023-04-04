import 'package:flutter/material.dart';

import 'info.dart' as info;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Partidos Políticos Brasileiros'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  static const int PARTY_COUNT = 31;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter = _counter% PARTY_COUNT;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _counter = _counter% PARTY_COUNT;
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 60, 0, 50),
            child: Image.asset(
              getPartyLogoPath((info.info_array[_counter])),
              height: 250,
            ),
          ),
          Column(
            children: [
              Text("${info.info_array[_counter][0]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
              Text("Sigla: ${info.info_array[_counter][1]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18 )  ),
              Text("Número Eleitoral: ${info.info_array[_counter][2]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
              Text("Número de Filiados: ${info.info_array[_counter][3]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)  ),
              Text("Data de criação: ${info.info_array[_counter][4]}" , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
              Text("Data de registro definintivo: ${info.info_array[_counter][5]}" , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
              Text("Presidente atual: ${info.info_array[_counter][6]}" , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
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
                    Text(getDisplayName(info.info_array[_counter]), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                    const Spacer(),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward, size: 44),
                        onPressed: _incrementCounter
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
