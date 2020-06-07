import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ponder', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: new Center(
        child: new Text("Hello world, journal"),
      ),
    );
  }
}