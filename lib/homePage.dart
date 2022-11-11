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
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: (() => dialogBuilder(context)),
          child: const ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: (() => dialogBuilder(context)),
          child: const ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarme'),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: (() => dialogBuilder(context)),
          child: const ListTile(
            leading: Icon(Icons.backpack),
            title: Text('Mochila'),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: (() => dialogBuilder(context)),
          child: const ListTile(
            leading: Icon(Icons.cable),
            title: Text('Cabo'),
          ),
        ),
      ]),
    );
  }
}
