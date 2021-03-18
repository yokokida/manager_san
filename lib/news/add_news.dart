import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddEventPage02 extends StatefulWidget {
  const AddEventPage02({Key key}) : super(key: key);

  @override
  _AddEventPage02State createState() => _AddEventPage02State();
}

class _AddEventPage02State extends State<AddEventPage02> {
  final String eventTtl = "title";
  final String eventDescription = "description";

  TextEditingController _eventTtlCont = TextEditingController();
  TextEditingController _eventDescriptionCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント追加"),
      ),
      body: Form(
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _eventTtlCont,
                  validator: (value) => (value.isEmpty) ? "Please Enter title" : null,
                  decoration: InputDecoration(
                      labelText: "予定",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _eventDescriptionCont,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) => (value.isEmpty) ? "Please Enter description" : null,
                  decoration: InputDecoration(
                      labelText: "詳細",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text(
                    'Save',
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.lightBlue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  if (_eventTtlCont.text.isNotEmpty || _eventDescriptionCont.text.isNotEmpty) {
                    createEvent(_eventTtlCont.text, _eventDescriptionCont.text);
                    _eventTtlCont.clear();
                    _eventDescriptionCont.clear();
                    print('schedule save');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createEvent(String title, String description) {
    FirebaseFirestore.instance.collection('schedule').add({
      eventTtl: title,
      eventDescription: description,
    });
  }
}