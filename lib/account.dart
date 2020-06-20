import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() {
    return _AccountTabState();
  }
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFD4FFFF),
      body: ListView(
        children: <Widget>[
          Container(
              color: Color(0xffFAF3DD),
              child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 28),
                  child: Center(
                      child: Text(
                    "Connie Liu",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  )))),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text("Your Plant Growth", style: TextStyle(fontSize: 20))),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Image(
                  width: 315,
                  height: 296,
                  image: AssetImage('img/plant_growth.png'))),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text("About Us", style: TextStyle(fontSize: 20))),
          Padding(
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(new Radius.circular(18.0))),
                child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text("Welcome to Pondr!",
                        style: TextStyle(fontSize: 20))),
              ))
        ],
      ),
    );
  }
}
