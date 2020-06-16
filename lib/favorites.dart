import 'package:flutter/material.dart';
import 'archive.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


//  Future navigateToSubPage(context) async{
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Archive()));
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD4FFFF),
        body:
        Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                    child: new Container(
                      child: new Center(
                          child: new Column(
                              children : [
                                // new Padding(padding: EdgeInsets.only(top: 140.0)),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(left:20, top:2, bottom:2),
                                    labelStyle: TextStyle(fontSize: 23, color: Color(0xFFC4C4C4)),
                                    labelText: "Search",
                                    icon: Icon(Icons.search),
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(

                                      borderRadius: new BorderRadius.circular(30.0),
                                      borderSide: new BorderSide(
                                      ),

                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ]
                          )
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(left: 32, top: 25, right: 32),
                    child: Container(
                        height: 120.0,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(-0.75, -1),
                              child: Container(
                                  child: FlatButton(
                                      color: Colors.transparent,
                                      onPressed:(){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Archive",
                                          style: TextStyle(
                                              color:Color(0xFF5E6472),
                                              //fontWeight: FontWeight.bold,
                                              fontSize:30.0
                                          ))
                                  )
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.75,-1),
                              child: Container(
                                padding: EdgeInsets.only(top:7),
                                child: Text(
                                  "Favorites",
                                  style: TextStyle(
                                      color: Color(0xFF5E6472),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 29.0,
                                top: 47.0,
                                child: new Container(
                                  width: 125.0,
                                  height: 4,
                                  decoration: new BoxDecoration(color: Color(0xFF5E6472)),
                                )
                            ),
                          ],
                        ))),

                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xFF5E6472),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0))),),


              ],

            ),

          ],
        ));
  }


}
