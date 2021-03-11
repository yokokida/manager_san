import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_san/news/page_calender_01.dart';
import 'package:manager_san/news/page_calender_02.dart';
import 'package:manager_san/player/page_player.dart';

import 'album/page_album.dart';
import 'coach/page_coach.dart';
import 'mypage/page_mypage.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = [
      Calender01Page(),
      Coaches(),
      Players(),
      Album(),
      MyPage(),
    ];
    super.initState();
  }

  // 見た目
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // オンタップ属性
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 各ページのボタン
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('TOP'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            title: Text('TOP'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle),
            title: Text('TOP'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text('TOP'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('TOP'),
          ),
        ],
        // デザイン
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        iconSize: 24.0,
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // todo
      ),
    );
  }
}

