import 'package:flutter/material.dart';
import 'services/mockapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asynchronous calls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Asynchronous calls'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String estadoAvion = "";
  Future<void> actualizarAvion() async {
    setState(() {
      estadoAvion = "Cargando...";
    });
    int contador = await MockApi().getFerrariInteger();
    setState(() {
      estadoAvion = contador.toString();
    });
  }

  String estadoCoche = "";
  Future<void> actualizarCoche() async {
    setState(() {
      estadoCoche = "Cargando...";
    });
    int contador = await MockApi().getHyundaiInteger();
    setState(() {
      estadoCoche = contador.toString();
    });
  }

  String estadoPersona = "";
  Future<void> actualizarPersona() async {
    setState(() {
      estadoPersona = "Cargando...";
    });
    int contador = await MockApi().getFisherPriceInteger();
    setState(() {
      estadoPersona = contador.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title, textAlign: TextAlign.center)),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      actualizarAvion();
                    },
                    child: Icon(Icons.flight, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  Text(estadoAvion),
                  ElevatedButton(
                    onPressed: () {
                      actualizarCoche();
                    },
                    child: Icon(Icons.directions_car, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.orange, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  Text(estadoCoche),
                  ElevatedButton(
                    onPressed: () {
                      actualizarPersona();
                    },
                    child: Icon(Icons.run_circle, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  Text(estadoPersona),
                ],
              ),
            ),
          ),
        ));
  }
}
