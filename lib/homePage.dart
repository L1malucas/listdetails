import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dialogBuilder.dart';
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
        title: const Text("lista e detalhes"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          final email = user['email'];
          final name = user['name']['first'];
          final avatar = user['picture']['thumbnail'];

          return InkWell(
              onTap: (() {
                dialogBuilder(context);
              }),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(avatar),
                  ),
                  title: Text(name),
                  tileColor: Colors.deepPurple[200],
                  subtitle: Text(email),
                ),
              ));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=8';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    setState(() {
      users = body['results'];
    });
  }
}
