import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stolarska_aplikacija/models/the_user.dart';
import 'package:stolarska_aplikacija/screens/loginRouter.dart';
import 'package:stolarska_aplikacija/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().userStream,
      initialData: null,
      child: MaterialApp(
        home: loginRouter(),
      ),
    );
  }
}
