import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manager_san/home.dart';
import 'package:manager_san/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'マネさん',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: HomeScreen(),
    );
  }
}
