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
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 32, top: 33, right: 32),
                    child: Container(
                        height: 120.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Text('Hi {User}!',
                                    style: TextStyle(
                                        color: Color(0xFF525764),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0))),
                            Positioned(
                                top: 40.0,
                                child: Text(
                                    'Let\'s get started, how are you doing?',
                                    style: TextStyle(
                                        color: Color(0xFF525764),
                                        fontSize: 20.0))),
                            Positioned(
                                bottom: 0.0,
                                right: 40.0,
                                child: Image(
                                    image: AssetImage('img/home_leaf.png')))
                          ],
                        ))),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text('{Date Here} | {Time Here}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0))),
                        Container(
                            width: 300.0,
                            height: 400.0,
                            child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(height: 1.6),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Start writing here!')))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 40,
                bottom: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Color(0xff1A782E),
                  child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Finish", style: TextStyle(fontSize: 25.0))),
                ))
          ],
        ));
  }
}
