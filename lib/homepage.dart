import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4FFFF),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0),
          Text('Hi <User>!'),
          Text('Lets get started, how are you doing?'),
          SizedBox(height: 40.0),
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height - 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0))),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Start your entry here.'))),
              Positioned(
                bottom: 100,
                right: 50,
                child: Container(
                  color: Color(0xff3FCCCC),
                  child: IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.white,
                    onPressed: () {
                      //onpressed code here
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
