import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Success"),
        backgroundColor: Colors.brown[600],
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Logout"),
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
