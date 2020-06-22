import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, top: -10, bottom: -10),
                            labelStyle: TextStyle(
                                fontSize: 23, color: Color(0xFFC4C4C4)),
                            labelText: "Search",
                            icon: Icon(Icons.search),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: 15, right: 32),
                  child: Container(
                    color: Color(0xFFD4FFFF),
                    height: 50.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32),
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                  color: Color(0xFF5E6472), fontSize: 25.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32),
                            child: Text(
                              "Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          child: new Container(
                            width: MediaQuery.of(context).size.width /2,
                            height: 3,
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
                  child: ListView(
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:25),
                              child: Text("January",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),

                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Color(0xFFC2F9BB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight:Radius.circular(30),
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount: 3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){

                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       ));
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                      Container(
                        width:200,
                        height: 300,
                        padding: EdgeInsets.only(top:15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children:[
                            Padding(
                              padding:EdgeInsets.only(left:25),
                              child: Text("February",
                              style: TextStyle(
                                color: Color(0xFF525764),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                              ),
                            ),
                            Container(
                              width:200,
                              height:300,
                              decoration:BoxDecoration(
                                color: Color(0xFFAED9E0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount:3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width:200,
                        height: 300,
                        padding: EdgeInsets.only(top:15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children:[
                            Padding(
                              padding:EdgeInsets.only(left:25),
                              child: Text("March",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width:200,
                              height:300,
                              decoration:BoxDecoration(
                                color: Color(0xFFFED3D3),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount:3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, top: -10, bottom: -10),
                            labelStyle: TextStyle(
                                fontSize: 23, color: Color(0xFFC4C4C4)),
                            labelText: "Search",
                            icon: Icon(Icons.search),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: 15),
                  child: Container(
                    color: Color(0xFFD4FFFF),
                    height: 50.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32,right: 32),
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32,right: 32),
                            child: Text(
                              "Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),

                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          left: MediaQuery.of(context).size.width /2,
                          child: new Container(
                            width: MediaQuery.of(context).size.width /2,
                            height: 3,
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
                  child: ListView(
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:25),
                              child: Text("January",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),

                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Color(0xFFC2F9BB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight:Radius.circular(30),
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount: 3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){

                                      Navigator.of(context)
                                          .push(CupertinoPageRoute<void>(
                                        builder: (BuildContext context) {
                                          return _ArticleView();
                                        },
                                      ));
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                      Container(
                        width:200,
                        height: 300,
                        padding: EdgeInsets.only(top:15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children:[
                            Padding(
                              padding:EdgeInsets.only(left:25),
                              child: Text("February",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width:200,
                              height:300,
                              decoration:BoxDecoration(
                                color: Color(0xFFAED9E0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount:3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width:200,
                        height: 300,
                        padding: EdgeInsets.only(top:15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children:[
                            Padding(
                              padding:EdgeInsets.only(left:25),
                              child: Text("March",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width:200,
                              height:300,
                              decoration:BoxDecoration(
                                color: Color(0xFFFED3D3),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount:3,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed:(){
                                      /*
                                       Navigator.of(context)
                                           .push(CupertinoPageRoute<void>(
                                         builder: (BuildContext context) {
                                           return _ArticleView();
                                         },
                                       )); */
                                    },
                                    child:Container(
                                      height:70,
                                      width:70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image:AssetImage('img/Capture.png')
                                        ),
                                      ),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleView extends StatefulWidget {
  @override
  __ArticleViewState createState() => __ArticleViewState();
}

class __ArticleViewState extends State<_ArticleView> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4FFFF),
      body: Stack(
        children: <Widget>[
          ListView(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.only(left:10, top:15, right:32),
                child: Container(
                  height: 60.0,
                  child: Stack(
                    children: <Widget>[
                      FlatButton(
                        onPressed:(){
                          Navigator.of(context)
                              .push(CupertinoPageRoute<void>(
                            builder: (BuildContext context) {
                              return ArchiveTab();
                            },
                          ));
                        },
                        child:Container(
                          child: Image(
                            width: 34,
                            height: 34,
                            image: AssetImage('img/arrow-01.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 800,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 210),
                      child: Image(
                          width: 45,
                          height: 45,
                          image: AssetImage('img/article_leaf.png')
                      ),
                    ),
                    Container(
                      height: 700,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          )
                      ),
                      child:Padding(
                        padding: EdgeInsets.only(top:1.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left:335,
                              top:10,
                              child:FlatButton(
                                onPressed:(){
                                  setState(()
                                  {
                                    isPressed = !isPressed;
                                  }
                                  );
                                },
                                child: Image(
                                  width:30,
                                  height:30,
                                  image:(isPressed) ? AssetImage('img/star.png') : AssetImage('img/filled_star.png'),
                                ),
                              ),
                            ),
                            Positioned(
                              left:100,
                              top:20,
                              child: Text('{Date Here}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.0)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:75, left:25),
                              child:Text('{Time Here}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:FontWeight.bold,
                                  fontSize:20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:110),
                              child:Container(
                                height:350,
                                width: MediaQuery.of(context).size.width,
                                decoration:BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0))
                                ),
                                child: Padding(
                                  padding:EdgeInsets.only(top:17,left:17,right:13),
                                  child:Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minim",
                                    style: TextStyle(
                                        height:1.3,
                                        fontSize:20.0
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}

