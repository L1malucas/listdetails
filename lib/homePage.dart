import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Detalhes'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Foto'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telefone'),
          )
        ],
      ),
    );
  }
}
