import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/models/the_user.dart';
import 'package:stolarska_aplikacija/screens/registered/new_ad.dart';
import 'package:stolarska_aplikacija/services/auth.dart';

import '../../models/the_user.dart';

class Home extends StatefulWidget {
  final TheUser user;
  const Home({Key? key, required this.user}) : super(key: key);

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
        title: const Text("Početna"),
        backgroundColor: Colors.brown[600],
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => NewAd(
                        buyer: widget.user,
                      )),
            ),
            child: const Text("Majstori"),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewAd(
                        buyer: widget.user,
                      )),
            ),
            child: const Text("Novi oglas"),
          ),
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text("Logout"),
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
