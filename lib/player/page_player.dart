import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager_san/player/screen_player.dart';

class Players extends StatelessWidget {

  IconData icon;
  String name;
  String school;

  Players({IconData icon, String name, String school}) {
    this.icon = icon;
    this.name = name;
    this.school = school;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("選手"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('players').snapshots(),
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
                              builder: (context) => Player(
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