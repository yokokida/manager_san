import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String profName = "name";
  final String profCompany = "company";
  final String profSchool = "school";
  final String profDatetime = "datetime";

  TextEditingController _newNameCont = TextEditingController();
  TextEditingController _newCompanyCont = TextEditingController();
  TextEditingController _newSchoolCont = TextEditingController();

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
            TextField(
              decoration: InputDecoration(
                hintText: ('学校'),
              ),
              controller: _newSchoolCont,
            ),
            RaisedButton(
              child: Text('監督作成'),
              onPressed: () {
                if (_newNameCont.text.isNotEmpty && _newCompanyCont.text.isNotEmpty) {
                  createCoach(_newNameCont.text, _newCompanyCont.text);
                }
                _newNameCont.clear();
                _newCompanyCont.clear();
                print('coach');
              },
            ),
            RaisedButton(
              child: Text('選手作成'),
              onPressed: () {
                if (_newNameCont.text.isNotEmpty && _newSchoolCont.text.isNotEmpty) {
                  createPlayer(_newNameCont.text, _newSchoolCont.text);
                }
                _newNameCont.clear();
                _newSchoolCont.clear();
                print('player');
              },
            ),
          ],
        ),
      ),
    );
  }

  void createCoach(String name, String company) {
    FirebaseFirestore.instance.collection('coaches').add({
      profName: name,
      profCompany: company,
    });
  }
  void createPlayer(String name, String school) {
    FirebaseFirestore.instance.collection('players').add({
      profName: name,
      profSchool: school,
    });
  }
}
