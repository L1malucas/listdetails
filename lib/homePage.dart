import 'package:flutter/material.dart';
import 'dialogBuilder.dart';

// ignore_for_file: prefer_final_fields
// ignore_for_file: prefer_const_constructors

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Map<String, IconData> icones = {
    'map': Icons.map,
    'phone': Icons.phone,
    'photo': Icons.photo,
    'ac_unit_outlined': Icons.ac_unit_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Lista e Detalhes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: icones.length,
        itemBuilder: (BuildContext context, int index) {
          var item = icones.entries.elementAt(index);

          return ElevatedButton(
            onPressed: (() => dialogBuilder(context)),
            child: ListTile(
              leading: Icon(item.value),
              title: Text(item.key),
            ),
          );
        },
      ),
    );
  }
}
