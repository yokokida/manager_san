import 'package:flutter/material.dart';
import 'package:manager_san/parts/members.dart';

class Coaches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("監督・コーチ"),
      ),
      // ===== 編集 =====================
      body: ListView(
        // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Tile(
              icon: Icons.person,
              username: "鹿太郎",
              message: "しかし、鹿しかいない",
            ),
            Tile(
              icon: Icons.person,
              username: "久米酒",
              message: "おいしいよー",
            ),
          ]),
      // ================================
    );
  }
}