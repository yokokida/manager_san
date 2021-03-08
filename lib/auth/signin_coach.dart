import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home.dart';


class CoachSigninScreen extends StatefulWidget {
  @override
  _CoachSigninScreenState createState() => _CoachSigninScreenState();
}

class _CoachSigninScreenState extends State<CoachSigninScreen> {
  String _email;
  String _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('コーチ登録'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('SignUp'),
            onPressed: () => signIn(),
          )
        ],
      ),
    );
  }

  void signIn() {
    auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }
}