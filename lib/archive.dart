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
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ListView(
                    children:[
                      Positioned(
                        left:0,
                        top:80,
                        child: new Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image:DecorationImage(
                              image: AssetImage('images/capture.png'),
                            ),
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: (){},
                            child: null,
                          ),

                        ),
                      ),

//                      Positioned(
//                        right: 20,
//                        bottom: 10,
//                        child: new Container(
//                        width: 100,
//                        height: 100,
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                              image:AssetImage('images/capture.png')
//                          ),
//                        ),
//                        child: FlatButton(
//                          padding: EdgeInsets.all(0.0),
//                          onPressed: (){},
//                          child: null,
//                        ),
//
//                      ),
//                      ),
//
//                      Positioned(
//                        child: new Container(
//                          width: 100,
//                          height: 100,
//                          decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image:AssetImage('images/capture.png')
//                            ),
//                          ),
//                          child: FlatButton(
//                            padding: EdgeInsets.all(0.0),
//                            onPressed: (){},
//                            child: null,
//                          ),
//
//                        ),
//                      ),



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
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class journalImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/capture.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }
}
