import 'package:flutter/material.dart';

class Coach extends StatelessWidget {

  String name;
  String company;

  Coach({String name, String company}) {
    this.name = name;
    this.company = company;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.name ?? '',
        ),
      ),
      body: Center(child: Text("Chat")),
      backgroundColor: Colors.cyan,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}