import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manager_san/auth/signin_coach.dart';
import 'package:manager_san/auth/signin_player.dart';
import 'package:manager_san/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
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
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('ログイン'),
                  onPressed: () => logIn(),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('監督・コーチ登録'),
                        onPressed: () => coachScreenPage(),
                      ),
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('選手・保護者登録'),
                        onPressed: () => playerScreenPage(),
                      )
                    ]
                ),
              ]
          )
        ],
      ),
    );
  }

  void logIn() {
    auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }
  void signIn() {
    auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }

  void coachScreenPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CoachSigninScreen())
    );
  }

  void playerScreenPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlayerSigninScreen())
    );
  }
}