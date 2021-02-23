import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {

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
                hintText: ('身長'),
              ),
            ),
            RaisedButton(
              child: Text('作成'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('players')
                    .document('id_abc')
                    .setData({'name': '鈴木', 'height': 140});
              },
            ),
          ],
        ),
      ),
    );
  }
}
