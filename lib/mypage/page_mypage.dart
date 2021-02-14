import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60.0,
              child: CircleAvatar(
                  child : Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('生年月日'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('住所'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('性別'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('名前'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('名前'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
