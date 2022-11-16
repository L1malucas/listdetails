import 'dart:convert';
import 'package:flutter/material.dart';
import 'detailsScreen.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lista todos"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];

          final email = user['email'];
          final name = user['name']['first'];
          final avatar = user['picture']['medium'];
          // print(users[index]);

          // print(user);
          return InkWell(
            onTap: (() {
              //adicionar outra tela aqui
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (coontext) => TelaDetalhes(
                          user: [user],
                        )),
              );
            }),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(avatar),
                  ),
                  title: Text(name),
                  tileColor: Colors.deepPurple[200],
                  subtitle: Text(email),
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

//GETALL
  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=7';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    setState(() {
      users = body['results'];
    });
  }
}
