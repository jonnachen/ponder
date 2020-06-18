import 'package:flutter/material.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children:[
          Container(
            color: Color(0xFFD4FFFF),
            child: ListView(
              children:[
                Container(
                  color: Color(0xFFD4FFFF),
                  padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(left:20,top:2,bottom:2),
                            labelStyle: TextStyle(fontSize:23, color: Color(0xFFC4C4C4)),
                            labelText:"Search",
                            icon: Icon(Icons.search),
                            fillColor:Colors.white,
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
                  padding: EdgeInsets.only(left:32,top:25,right:32),
                  child:Container(
                    color: Color(0xFFD4FFFF),
                    height: 120.0,
                    child: Stack(
                      children:[
                        Align(
                          alignment:Alignment(0.75,-1),
                          child: Container(
                            child: Text("Favorites",
                              style: TextStyle(
                                  color:Color(0xFF5E6472),
                                  fontSize:30.0
                              ),
                            ),

                          ),
                        ),
                        Align(
                          alignment:Alignment(-0.75,-1),
                          child: Container(
                            padding: EdgeInsets.only(top:0,left:15),
                            child: Text("Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:44.0,
                          top: 40.0,
                          child: new Container(
                            width: 100.0,
                            height:4,
                            decoration: new BoxDecoration(
                                color:Color(0xFF5E6472)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  padding:EdgeInsets.only(bottom: 200),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children:[
                      Container(
                        padding: EdgeInsets.only(top:15,left:15),
                        child: ListView(
                          children: [
                            Text("January",
                              style: TextStyle(
                                color: Color(0xFF525764),
                                fontWeight: FontWeight.bold,
                                fontSize:40.0,
                              ),
                            ),
                            FlatButton(
                              onPressed:(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _ArticleView()));
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
                        padding: EdgeInsets.only(top:15,left:15),
                        child: Text("February",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize:40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFAED9E0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:15,left:15),
                        child: Text("March",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize:40.0,
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
              children:[
                Container(
                  color: Color(0xFFD4FFFF),
                  padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: new Container(
                    child: new Center(
                      child: new Column(children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(left:20,top:2,bottom:2),
                            labelStyle: TextStyle(fontSize:23, color: Color(0xFFC4C4C4)),
                            labelText:"Search",
                            icon: Icon(Icons.search),
                            fillColor:Colors.white,
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
                  padding: EdgeInsets.only(left:32,top:25,right:32),
                  child:Container(
                    color: Color(0xFFD4FFFF),
                    height: 120.0,
                    child: Stack(
                      children:[
                        Align(
                          alignment:Alignment(0.75,-1),
                          child: Container(
                            child: Text("Favorites",
                              style: TextStyle(
                                  color:Color(0xFF5E6472),
                                  fontWeight:FontWeight.bold,
                                  fontSize:30.0
                              ),
                            ),

                          ),
                        ),
                        Align(
                          alignment:Alignment(-0.75,-1),
                          child: Container(
                            padding: EdgeInsets.only(top:0,left:15),
                            child: Text("Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 30.0
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right:29.0,
                          top: 40.0,
                          child: new Container(
                            width: 125.0,
                            height:4,
                            decoration: new BoxDecoration(
                                color:Color(0xFF5E6472)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  padding:EdgeInsets.only(bottom: 200),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children:[
                      Container(
                        padding: EdgeInsets.only(top:15,left:15),
                        child: ListView(
                          children: [
                            Text("January",
                              style: TextStyle(
                                color: Color(0xFF525764),
                                fontWeight: FontWeight.bold,
                                fontSize:40.0,
                              ),
                            ),
                            FlatButton(
                              onPressed:(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _ArticleView()));
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
                        padding: EdgeInsets.only(top:15,left:15),
                        child: Text("February",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize:40.0,
                          ),
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFAED9E0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:15,left:15),
                        child: Text("March",
                          style: TextStyle(
                            color: Color(0xFF525764),
                            fontWeight: FontWeight.bold,
                            fontSize:40.0,
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

class _ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD4FFFF),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 32, right: 32),
                    child: Container(
                        height: 150.0,
                        child: Stack(
                          children: <Widget>[
                            FlatButton(
                              onPressed:(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Archive()));
                              },
                              child: Positioned(
                                child: Image(
                                  width:34,
                                  height:34,
                                  image:AssetImage('img/arrow-01.png'),
                                ),
                              ),
                            ),

                            Positioned(
                                bottom: 0.0,
                                right: 40.0,
                                child: Image(
                                    width: 70,
                                    height: 140,
                                    image: AssetImage('img/transplant-01.png')))
                          ],
                        ))),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children:[
                      Padding(
                        padding: EdgeInsets.only(top:30.0),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.0),
                              child: Center(
                                  child: Text('{Date Here}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.0))
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:45, left:25),
                              child:Text('{Time Here}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:FontWeight.bold,
                                  fontSize:20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:80),
                              child:Container(
                                height:MediaQuery.of(context).size.height - 150,
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
                                  padding:EdgeInsets.only(top:15,left:10,right:10),
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

