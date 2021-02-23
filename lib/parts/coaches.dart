import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList();

  get queryTags => null;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('coaches')
          .orderBy('timestamp', descending: true)
          .where('tags', arrayContainsAny: this.queryTags)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return new Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              shrinkWrap: true,
              children: snapshot.data.docs
                  .map((DocumentSnapshot document) {
                return new GestureDetector(
                  onTap: () => print('tapped'),
                  child: new Card(
                    child: ListTile(
                      title: new Text(document['title']),
                      subtitle: new Text(document['tags']
                          .join(',')),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}