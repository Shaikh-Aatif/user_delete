import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //THIS IS THE FUNCTION THAT DELETES THE USER FROM AUTH TABLE :)

    Future<User?> deleteuser() async {
      User user = FirebaseAuth.instance.currentUser!;
      user.delete();
      return null;
    }

    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: deleteuser, child: const Text("Delete User"))
      ]),
    );
  }
}
