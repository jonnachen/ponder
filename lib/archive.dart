import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveTab extends StatefulWidget {
  @override
  _ArchiveTabState createState() {
    return _ArchiveTabState();
  }
}

class _ArchiveTabState extends State<ArchiveTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color(0xFFD4FFFF),
            child: ListView(
              children: [
                Container(
                  color: Color(0xFFD4FFFF),
                  padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 2),
                            labelStyle: TextStyle(
                                fontSize: 23, color: Color(0xFFC4C4C4)),
                            labelText: "Search",
                            icon: Icon(Icons.search),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, top: 25, right: 32),
                  child: Container(
                    color: Color(0xFFD4FFFF),
                    height: 120.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, -1),
                          child: Container(
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                  color: Color(0xFF5E6472), fontSize: 30.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Text(
                              "Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 44.0,
                          top: 40.0,
                          child: new Container(
                            width: 100.0,
                            height: 4,
                            decoration:
                                new BoxDecoration(color: Color(0xFF5E6472)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  padding: EdgeInsets.only(bottom: 200),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: ListView(
                          children: [
                            Text(
                              "January",
                              style: TextStyle(
                                color: Color(0xFF525764),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
/*                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _ArticleView())); */
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage('img/capture.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFC2F9BB),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "February",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFAED9E0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "March",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFFED3D3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFD4FFFF),
            child: ListView(
              children: [
                Container(
                  color: Color(0xFFD4FFFF),
                  padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 2),
                            labelStyle: TextStyle(
                                fontSize: 23, color: Color(0xFFC4C4C4)),
                            labelText: "Search",
                            icon: Icon(Icons.search),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, top: 25, right: 32),
                  child: Container(
                    color: Color(0xFFD4FFFF),
                    height: 120.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, -1),
                          child: Container(
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Text(
                              "Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 29.0,
                          top: 40.0,
                          child: new Container(
                            width: 125.0,
                            height: 4,
                            decoration:
                                new BoxDecoration(color: Color(0xFF5E6472)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  padding: EdgeInsets.only(bottom: 200),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: ListView(
                          children: [
                            Text(
                              "January",
                              style: TextStyle(
                                color: Color(0xFF525764),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
/*                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _ArticleView())); */
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage('img/capture.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFC2F9BB),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "February",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFAED9E0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "March",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFFED3D3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
