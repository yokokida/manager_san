import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String profName = "name";
  final String profCompany = "company";
  final String profDatetime = "datetime";

  TextEditingController _newNameCont = TextEditingController();
  TextEditingController _newCompanyCont = TextEditingController();

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
                hintText: ('名前'),
              ),
              controller: _newNameCont,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ('会社'),
              ),
              controller: _newCompanyCont,
            ),
            RaisedButton(
              child: Text('作成'),
              onPressed: () {
                if (_newNameCont.text.isNotEmpty && _newCompanyCont.text.isNotEmpty) {
                  createProf(_newNameCont.text, _newCompanyCont.text);
                }
                _newNameCont.clear();
                _newCompanyCont.clear();
                print('kara');
              },
            ),
          ],
        ),
      ),
    );
  }

  void createProf(String name, String company) {
    FirebaseFirestore.instance.collection('coaches').add({
      profName: name,
      profCompany: company,
    });
  }
}
