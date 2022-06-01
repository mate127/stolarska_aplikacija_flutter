import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/screens/anonymous/anonymous.dart';
import 'package:stolarska_aplikacija/screens/anonymous/register.dart';
import 'package:stolarska_aplikacija/services/auth.dart';
import 'package:stolarska_aplikacija/services/loading.dart';

import '../../models/constants.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        leadingWidth: MediaQuery.of(context).size.width,
        leading: TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Anonymous()));
            },
            child: const Text(
              "Početna",
              style: TextStyle(fontSize: 20.0),
            )),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              icon: const Icon(Icons.person),
              label: const Text("Registracija"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (value) =>
                      value!.isEmpty ? "Ovo polje je obavezno" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Lozinka"),
                  validator: (value) => value!.length < 6
                      ? "Lozinka mora biti duljine barem 6 znakova"
                      : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result =
                          await _auth.signInWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Neuspješna prijava.";
                          loading = false;
                        });
                      }
                    }
                  },
                  child: const Text(
                    "Prijavi se",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[700])),
                ),
                const SizedBox(height: 12.0),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            )),
      ),
    );
  }
}
