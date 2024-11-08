import 'package:flutter/material.dart';

void main() {
  runApp(ContadorDeLetrasApp());
}

class ContadorDeLetrasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Letras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContadorDeLetrasScreen(),
    );
  }
}

class ContadorDeLetrasScreen extends StatefulWidget {
  @override
  _ContadorDeLetrasScreenState createState() => _ContadorDeLetrasScreenState();
}

class _ContadorDeLetrasScreenState extends State<ContadorDeLetrasScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _textoProcesado = "";

  void _contarLetras() {
    String input = _inputController.text;
    Map<String, int> contador = {};

    for (var char in input.split('')) {
      contador[char] = (contador[char] ?? 0) + 1;
    }

    setState(() {
      _textoProcesado = contador.entries
          .map((entry) => '${entry.key}${entry.value}')
          .join('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador de Letras')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Ingrese texto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _contarLetras,
              child: Text('Contar letras'),
            ),
            SizedBox(height: 20),
            Text(
              'Texto procesado: $_textoProcesado',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
