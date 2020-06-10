import 'package:flutter/material.dart';
import 'homepage.dart';
import 'archive.dart';
import 'account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Ponder',
        theme: ThemeData(fontFamily: 'SF Pro'),
        home: MyBottomNavigationBar());
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Homepage(),
    Archive(),
    Account(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff52E3D2),
        unselectedItemColor: Colors.grey[500],
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Add")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.history), title: new Text("Archive")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle), title: new Text("Account")),
        ],
      ),
    );
  }
}
