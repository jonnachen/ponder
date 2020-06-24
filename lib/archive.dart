import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'classes/user.dart';
import 'classes/journalEntry.dart';
import 'package:intl/intl.dart';
import 'utils.dart' as utils;

class ArchiveTab extends StatefulWidget {
  final User user;

  const ArchiveTab({Key key, @required this.user}) : super(key: key);

  @override
  _ArchiveTabState createState() {
    return _ArchiveTabState();
  }
}

class _ArchiveTabState extends State<ArchiveTab> {
  bool loading = false;
  Map<String, List<Journal>> journals = {};

  processJournals(user) {
    setState(() {
      loading = true;
    });
    user.journals.forEach((journalEntry) {
      //  DateFormat.yMMMM is the month and day of the entry
      String formattedDate =
          DateFormat.yMMMM('en_US').format(journalEntry.updatedAt);
      if (journals.containsKey(formattedDate)) {
        journals[formattedDate]
            .add(Journal(journalEntry: journalEntry, user: user));
      } else {
        journals[formattedDate] = [
          Journal(journalEntry: journalEntry, user: user)
        ];
      }
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    processJournals(user);
    var dates = journals.keys.toList();
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color(0xFFD4FFFF),
            child: ListView(
              children: [
                loading
                    ? CircularProgressIndicator()
                    : Container(
                        color: Color(0xFFD4FFFF),
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: new Container(
                          child: new Center(
                            child: new Column(children: [
                              new TextFormField(
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: -10, bottom: -10),
                                  labelStyle: TextStyle(
                                      fontSize: 23, color: Color(0xFFC4C4C4)),
                                  labelText: "Search",
                                  icon: Icon(Icons.search),
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(50.0),
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 32),
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
                                  letterSpacing: 1.4,
                                  color: Color(0xFF5E6472),
                                  fontSize: 25.0),
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
                                  letterSpacing: 1.4,
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          child: new Container(
                            width: MediaQuery.of(context).size.width / 2,
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
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                dates[0],
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFC2F9BB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: GridView.count(
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var journal in journals[dates[0]])
                                    journal
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "May 2020",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFAED9E0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                              ),
                              child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var i = 0; i < 5; i++)
                                    Journal(
                                        journalEntry: user.journals[i],
                                        user: user)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "April 2020",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFFED3D3),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                              ),
                              child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var i = 0; i < 3; i++)
                                    Journal(
                                        journalEntry: user.journals[i],
                                        user: user)
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
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    color: Color(0xFFD4FFFF),
                    height: 50.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                  letterSpacing: 1.4,
                                  color: Color(0xFF5E6472),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.75, -1),
                          child: Container(
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: Text(
                              "Archive",
                              style: TextStyle(
                                  color: Color(0xFF5E6472),
                                  letterSpacing: 1.4,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          left: MediaQuery.of(context).size.width / 2,
                          child: new Container(
                            width: MediaQuery.of(context).size.width / 2,
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
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "January",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFC2F9BB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var journal in user.journals)
                                    Journal(journalEntry: journal, user: user)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "February",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFAED9E0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                              ),
                              child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var journal in user.journals)
                                    Journal(journalEntry: journal, user: user)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "March",
                                style: TextStyle(
                                  color: Color(0xFF525764),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xFFFED3D3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
                                  for (var journal in user.journals)
                                    Journal(journalEntry: journal, user: user)
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
  final JournalEntry journalEntry;
  final User user;

  const _ArticleView(
      {Key key, @required this.journalEntry, @required this.user})
      : super(key: key);

  @override
  __ArticleViewState createState() => __ArticleViewState();
}

class __ArticleViewState extends State<_ArticleView> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final journalEntry = widget.journalEntry;
    final article = journalEntry.article;
    return Scaffold(
      backgroundColor: Color(0xFFD4FFFF),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 1300,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 15, right: 32),
                      child: Container(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(CupertinoPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return ArchiveTab(user: user);
                                  },
                                ));
                              },
                              child: Container(
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
                      height: 550,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 210),
                            child: Image(
                                width: 45,
                                height: 45,
                                image: AssetImage('img/article_leaf.png')),
                          ),
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 335,
                                  top: 10,
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        isPressed = !isPressed;
                                      });
                                    },
                                    child: Image(
                                      width: 30,
                                      height: 30,
                                      image: (isPressed)
                                          ? AssetImage('img/star.png')
                                          : AssetImage('img/filled_star.png'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 25,
                                  top: 20,
                                  child: Text(
                                    "${utils.formatDate(journalEntry.updatedAt)}",
                                    style: TextStyle(
                                        letterSpacing: 1.3,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                ),
                                Positioned(
                                  left: 25,
                                  top: 75,
                                  child: Text(
                                    "${utils.formatTime(journalEntry.updatedAt)}",
                                    style: TextStyle(
                                      letterSpacing: 1.3,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 120),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: Offset(0, -3),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: ListView(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 35, right: 35),
                                          child: Text(
                                            journalEntry.text,
                                            style: TextStyle(
                                                height: 1.3, fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              /*Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Center(
                                  child: Text(
                                    "Based on your journal entry,",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF525764),
                                    ),
                                  ),
                                ),
                              ),*/
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Center(
                                  child: Text(
                                    "you should read this:",
                                    style: TextStyle(
                                      letterSpacing: 1.8,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF525764),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAF3DD),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 25,
                                    left: 35,
                                    right: 35,
                                    child: Text(
                                      article.title,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF525764),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 32, bottom: 20),
                                      child: Text(
                                        "${article.url}",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0x44CEC9),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              //borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: ListView(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 30, left: 40, right: 40),
                                  child: Container(
                                    color: Colors.white,
                                    height: 2000.0,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, top: 30, right: 20),
                                        child: WebView(
                                            initialUrl: article.url,
                                            javascriptMode:
                                                JavascriptMode.unrestricted)),
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
        ],
      ),
    );
  }
}

class Journal extends StatefulWidget {
  final JournalEntry journalEntry;
  final User user;

  const Journal({Key key, @required this.journalEntry, @required this.user})
      : super(key: key);

  @override
  _JournalState createState() => _JournalState(journalEntry, user);
}

class _JournalState extends State<Journal> {
  final JournalEntry journalEntry;
  final User user;
  _JournalState(this.journalEntry, this.user);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return _ArticleView(journalEntry: journalEntry, user: user);
          },
        ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(1, 3),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(image: AssetImage('img/Capture.PNG')),
            ),
          ),
          Positioned(
            top: 10,
            left: 12,
            child: Text(
              "${utils.getDay(journalEntry.createdAt)}",
              style: TextStyle(
                color: Color(0xFF525764),
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 12,
            child: Text(
              "${utils.formatTime(journalEntry.createdAt)}",
              style: TextStyle(
                color: Color(0xFF525764),
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
