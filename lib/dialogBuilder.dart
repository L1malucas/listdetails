import 'package:flutter/material.dart';

Future<void> dialogBuilder(
    String country, String city, String state, BuildContext context) {
  final pais = country;
  final cidade = city;
  final estado = state;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(pais),
        content: Text('Estado: $estado \nCidade: $cidade'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
