import 'package:flutter/material.dart';

class Player extends StatelessWidget {

  String name;
  String school;

  Player({String name, String school}) {
    this.name = name;
    this.school = school;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.name ?? '',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(Icons.dehaze),
                onPressed: () => {},
              )),
        ],
      ),
      body: Center(child: Text("Chat")),
      backgroundColor: Colors.cyan,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () => {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Aa',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}