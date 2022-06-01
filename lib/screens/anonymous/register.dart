import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/models/constants.dart';
import 'package:stolarska_aplikacija/models/the_user.dart';
import 'package:stolarska_aplikacija/screens/anonymous/anonymous.dart';
import 'package:stolarska_aplikacija/screens/anonymous/sign_in.dart';
import '../../services/auth.dart';
import '../../services/loading.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);
  Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

enum typeOfUser { buyer, carpenter }

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String username = "";
  String email = "";
  String password = "";
  String repeatPassword = " ";
  String error = "";
  typeOfUser? user = typeOfUser.buyer;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[600],
              //title: const Text("Registracija"),
              leadingWidth: 130.0,
              leading: TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Anonymous()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    "Početna",
                    style: TextStyle(fontSize: 20.0),
                  )),
              actions: [
                TextButton.icon(
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("Prijava")),
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Korisničko ime"),
                        validator: (value) =>
                            value!.isEmpty ? "Ovo polje je obavezno" : null,
                        onChanged: (value) {
                          setState(() {
                            if (mounted) {
                              username = value;
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Email"),
                        validator: (value) =>
                            value!.isEmpty ? "Ovo polje je obavezno" : null,
                        onChanged: (value) {
                          setState(() {
                            if (mounted) {
                              email = value;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Lozinka"),
                        validator: (value) => value!.length < 6
                            ? "Lozinka mora biti duljine barem 6 znakova"
                            : null,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            if (mounted) {
                              password = value;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Ponovi lozinku"),
                        validator: (value) => value != password
                            ? "Lozinke moraju biti iste"
                            : null,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      RadioListTile<typeOfUser?>(
                        title: const Text("Kupac"),
                        value: typeOfUser.buyer,
                        groupValue: user,
                        onChanged: (typeOfUser? value) {
                          setState(() {
                            user = value;
                            print("DA");
                          });
                        },
                      ),
                      RadioListTile<typeOfUser?>(
                        title: const Text("Stolar"),
                        value: typeOfUser.carpenter,
                        groupValue: user,
                        onChanged: (typeOfUser? value) {
                          setState(() {
                            user = value;
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
                            dynamic result = await _auth.registerWithEmail(
                                email, password, user, username);
                            if (result == null) {
                              setState(() {
                                error =
                                    "Email nije pravilan ili se već koristi.";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: const Text(
                          "Registriraj se",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[700])),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  )),
            ),
          );
  }
}
