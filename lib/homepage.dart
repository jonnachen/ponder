import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _AddEntryView createState() => _AddEntryView();
}

class _AddEntryView extends State<Homepage> {
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
                  onPressed: () {
                    //store entry here
                    //navigate to new page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => _EndView()));
                  },
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

class _ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD4FFFF),
        body: Stack(
          children: <Widget>[
            ListView(children: <Widget>[
              Container(
                  height: 155.0,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(left: 32, top: 33, right: 32),
                          child: ListView(
                            children: <Widget>[
                              Text("Here\'s your article of the day!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold)),
                              Text("Live Long and Prosper",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0)),
                              Text("- Star Trek Guy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0))
                            ],
                          )),
                      Positioned(
                          left: 272,
                          bottom: 0,
                          child:
                              Image(image: AssetImage('img/article_leaf.png')))
                    ],
                  )),
              Container(
                  color: Color(0xFFFAF3DD),
                  child: Padding(
                      padding: EdgeInsets.only(left: 32, top: 28, bottom: 20),
                      child: Text("{Article Name Here}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                              color: Color(0XFF5E6472))))),
              Container(
                  color: Colors.white,
                  height: 600.0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, top: 30, right: 40),
                      child: Text(
                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minim",
                          style: TextStyle(fontSize: 20.0, height: 1.3))))
            ]),
            Positioned(
                right: 40,
                bottom: 70,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    //store entry here
                    //navigate to new page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => _EndView()));
                  },
                  color: Colors.white,
                  textColor: Color(0xff1A782E),
                  child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Next", style: TextStyle(fontSize: 25.0))),
                ))
          ],
        ));
  }
}

// none of this code is showing up : (
class _EndView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: ListView(children: <Widget>[
                Text("Today is January 13, 2020.",
                    style: TextStyle(
                        color: Color(0xFF525764),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0)),
                Text(
                    "Hope you have a great day today! Feel free to write another entry.",
                    style: TextStyle(color: Color(0xFF525764), fontSize: 14.0)),
                Container(
                  height: 100,
                  child: ListView(
                    children: <Widget>[
                      Text("2:04am",
                          style: TextStyle(
                              color: Color(0xFF525764),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      Container(
                          height: 100, child: Text("January 13, 2020, 2:04am")),
                      Container(height: 100, child: Text("Stress 101"))
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
                top: 317,
                left: 114,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    //store entry here
                    //navigate to new page
                  },
                  color: Colors.white,
                  textColor: Color(0xff1A782E),
                  child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child:
                          Text("New Entry", style: TextStyle(fontSize: 25.0))),
                )),
            Positioned(
                top: 676,
                left: 271,
                child: Image(image: AssetImage('img/article_leaf.png')))
          ],
        ));
  }
}
