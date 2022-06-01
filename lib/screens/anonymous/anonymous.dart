import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/screens/anonymous/register.dart';
import 'package:stolarska_aplikacija/screens/anonymous/sign_in.dart';

class Anonymous extends StatefulWidget {
  const Anonymous({Key? key}) : super(key: key);

  @override
  State<Anonymous> createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Početna"),
        backgroundColor: Colors.brown[600],
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: const Icon(Icons.person),
              label: const Text("Prijava")),
          TextButton(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Text("Registracija")),
        ],
      ),
      body: ListView(),
    );
  }
}
