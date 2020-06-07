import 'package:flutter/material.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("this is the archive page"),
      ),
    );
  }
}
