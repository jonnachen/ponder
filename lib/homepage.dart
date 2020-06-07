import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ponder', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: new Center(
        child: new Text("Hello world, home"),
      ),
    );
  }
}
