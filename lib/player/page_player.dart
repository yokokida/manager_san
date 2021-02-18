import 'package:flutter/material.dart';
import 'package:manager_san/parts/members.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("選手"),
      ),
      // ===== 編集 =====================
      body: ListView(
        // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Tile(icon: Icons.person, username: "くら", message: "とっても美味しい沖縄のお酒"),
            Tile(icon: Icons.person, username: "団長", message: "止まるんじゃ、ねぇぞ"),
            Tile(icon: Icons.person, username: "サルーイン", message: "こい"),
            Tile(icon: Icons.person, username: "あすらん", message: "キラァァァァ"),
            Tile(icon: Icons.person, username: "知人B", message: "1.14 release !"),
          ]),
      // ================================
    );
  }
}