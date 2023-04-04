import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Partidos Políticos Brasileiros'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Party {
  String name;
  String abbreviation;
  int electoralNumber;
  int affiliateCount;
  String creationDate;
  String registerDate;
  String currentPresident;

  Party(
      {required this.name,
      required this.abbreviation,
      required this.electoralNumber,
      required this.affiliateCount,
      required this.creationDate,
      required this.registerDate,
      required this.currentPresident});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Party> parties = [
    Party(
        name: "abcdef",
        abbreviation: "—",
        electoralNumber: 99,
        affiliateCount: 100,
        registerDate: "01/01/2023",
        creationDate: "01/01/2020",
        currentPresident: "bob")
  ];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  String getDisplayName(party) {
    String displayName;
    if (party.abbreviation == "—") {
      displayName = party.name;
    } else {
      displayName = party.abbreviation;
    }

    return displayName;
  }

  String getPartyLogoPath(party) {
    String fileName = getDisplayName(party);
    String fullPath = "assets/logos/$fileName.png";

    return fullPath;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          //Image.asset(getPartyLogoPath(parties[0])),
          Column(
            children: [
              Text(getDisplayName(parties[0])),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text('Bottom Button!')),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
