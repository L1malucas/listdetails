import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaDetalhes extends StatefulWidget {
  TelaDetalhes({super.key});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getuser();
    });
  }

  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detalhes"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          final country = user['location']['country'];
          final city = user['location']['city'];
          final state = user['location']['state'];
          print('country $country');
          print('city $city');
          print('state $state');

          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            child: Card(
              child: ListTile(
                leading: Text(country),
                title: Text(city),
                tileColor: Colors.deepPurple[200],
                subtitle: Text(state),
              ),
            ),
          );
        }),
      ),
    );
  }

  //GETALL
  void getuser() async {
    const url = 'https://randomuser.me/api/?user=7';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    setState(() {
      users = body['results'];
    });
  }
}
