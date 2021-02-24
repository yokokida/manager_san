import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager_san/coach/screen_coach.dart';

class Coaches extends StatelessWidget {

  IconData icon;
  String name;
  String company;

  Coaches({IconData icon, String name, String company}) {
    this.icon = icon;
    this.name = name;
    this.company = company;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("監督・コーチ"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('coaches').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          if (!snapshot.hasData) {
            return Text("loading");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }
          // List<DocumentSnapshot> coaches = snapshot.data.docs;
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text(snapshot.data.docs[index]["name"]),
                    subtitle: Text(snapshot.data.docs[index]["name"]),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coach(
                            name: this.name,
                          )
                        )
                      )
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}