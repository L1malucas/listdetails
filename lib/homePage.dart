import 'package:flutter/material.dart';
import 'dialogBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Detalhes'),
        centerTitle: true,
      ),
      body: ListView(children: [
        ElevatedButton(
          onPressed: (() => dialogBuilder(context)),
          child: const ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
          ),
        ),
      ]),
    );
  }
}
