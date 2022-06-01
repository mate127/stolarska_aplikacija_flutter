import 'package:flutter/material.dart';
import 'package:stolarska_aplikacija/models/the_user.dart';
import 'package:stolarska_aplikacija/models/constants.dart';
import 'package:stolarska_aplikacija/services/database.dart';

class NewAd extends StatefulWidget {
  final TheUser buyer;
  const NewAd({Key? key, required this.buyer}) : super(key: key);

  @override
  State<NewAd> createState() => _NewAdState();
}

class _NewAdState extends State<NewAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
          child: Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Naslov",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  isDense: true,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: "Opis traženog proizvoda"),
                maxLines: null,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {},
                child: const Text(
                  "Objavi",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[600])),
              ),
            ]),
          )),
    );
  }
}
