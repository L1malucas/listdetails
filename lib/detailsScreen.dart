import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({super.key});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  void initState() {
    super.initState();
    debugPrint("antes do get");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getuser();
      debugPrint("depois do get");
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
          final name = user['name']['first'];
          final username = user['login']['username'];

          final last = user['name']['last'];
          final avatar = user['picture']['large'];

          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 370,
            child: Card(
              color: Colors.deepPurple[200],
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '$name $last ',
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      '@s$username',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Image.network(avatar),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'País: $country\n'
                      'Cidade: $city\n'
                      'Estado: $state\n',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  //GETALL
  void getuser() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?user=7'));
    final body = jsonDecode(response.body);
    setState(() {
      users = body['results'];
    });
  }
}
