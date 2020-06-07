import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ponder', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: new Center(
        child: new Text("Hello world, calendar"),
      ),
    );
  }
}