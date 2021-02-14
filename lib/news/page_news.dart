import 'package:flutter/material.dart';


class News extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ニュース"),
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
