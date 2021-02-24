import 'package:flutter/material.dart';


class Album extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("アルバム"),
      ),
      body: Container(
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addImage(),
      ),
    );
  }

  addImage() {}
}
