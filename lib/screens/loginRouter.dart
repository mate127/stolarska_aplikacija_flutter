import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stolarska_aplikacija/screens/anonymous/anonymous.dart';
import 'package:stolarska_aplikacija/screens/registered/home.dart';
import '../models/the_user.dart';

class loginRouter extends StatelessWidget {
  const loginRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context);
    if (user == null) {
      return Anonymous();
    } else {
      return Home();
    }
  }
}
