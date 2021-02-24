import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  String username;

  Player({String username}) {
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.username ?? '',
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