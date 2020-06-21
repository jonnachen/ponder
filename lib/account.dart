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
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              color: Color(0xffFAF3DD),
              child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 15),
                  child: Text(
                    "Connie Liu",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff525764)),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text("Your Plant Growth",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff525764)))),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 35, right: 35),
              child: Container(
                width: 320,
                height: 320,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.asset(
                    'img/plant_growth.png',
                    width: 320.0,
                    height: 320.0,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Center(
              child: Text("Your Longest Streak: 7 days",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff525764)))),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text("About Us",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff525764)))),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 35, right: 35, bottom: 15),
              child: Container(
                  width: 360,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(new Radius.circular(18.0))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 15),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Text("What We Do",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff3FCCCC))),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 8, bottom: 15),
                            child: Text(
                                "Welcome to Ponder! We are a journaling app that uses Facebook's Wit.AI technology to recommend articles for the improvement of your lifestyle and mental health.",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Text("Meet the Team",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff3FCCCC))),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text("💛 Jonna Chen",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text("Front-end Developer",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("💛 Angelina Saliling",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text("Full stack developer",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("💛 Julie Helenek",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text("Front-end Developer",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("🌊 Connie Liu",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text("Product Designer",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("💛 Emily Chin",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff525764))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text("Product Designer",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff525764))),
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }
}
