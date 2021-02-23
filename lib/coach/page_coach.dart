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
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Text('Loading...');
            default:
              List<DocumentSnapshot> coaches = snapshot.data.docs;
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                itemCount: coaches.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.account_box),
                        title: Text(coaches[index]["name"]), // <- 追加：ユーザ名の設定
                        subtitle: Text(coaches[index]["company"]), // <- 追加：メッセージの設定
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Coach(
                                    name: this.name,
                                  )))
                        },
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}