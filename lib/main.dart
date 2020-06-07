import 'package:flutter/material.dart';
import 'personaljournal.dart';
import 'calendar.dart';
import 'homepage.dart';
import 'articles.dart';

void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar()
    );
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
    Journal(),
    Calendar(),
    Articles(),
  ];

  void onTappedBar(int index)
  {
    setState((){
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey[500],
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text("Journal")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              title: new Text("Calendar")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text("Archive")
          ),
        ],
      ),
    );
  }
}

