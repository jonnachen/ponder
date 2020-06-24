import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'classes/user.dart';
import 'classes/journalEntry.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
        journals[formattedDate].add(Journal(journalEntry: journalEntry));
      } else {
        journals[formattedDate] = [Journal(journalEntry: journalEntry)];
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
                                    Journal(journalEntry: user.journals[i])
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
                                    Journal(journalEntry: user.journals[i])
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
                            contentPadding: EdgeInsets.only(
                                left: 20, top: -10, bottom: -10),
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
                                  color: Color(0xFF5E6472), fontSize: 25.0),
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
                                    Journal(journalEntry: journal)
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
                                    Journal(journalEntry: journal)
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
                                    Journal(journalEntry: journal)
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
  final User journalEntry;

  const _ArticleView({Key key, @required this.journalEntry}) : super(key: key);

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
            children: <Widget>[
              Container(
                height: 1300,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 15, right: 32),
                      child: Container(
                        height: 60.0,
                        child: Stack(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(CupertinoPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return ArchiveTab();
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
                            height: 350,
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
                                  left: 100,
                                  top: 20,
                                  child: Text(
                                    "{Date Here}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                ),
                                Positioned(
                                  left: 25,
                                  top: 75,
                                  child: Text(
                                    "{Time Here}",
                                    style: TextStyle(
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
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: ListView(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 17, left: 17, right: 13),
                                          child: Text(
                                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minim",
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
                              Padding(
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
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Center(
                                  child: Text(
                                    "you should read this:",
                                    style: TextStyle(
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
                                    left: 20,
                                    child: Text(
                                      "Stress 101",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF525764),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 20,
                                    child: InkWell(
                                      child: Text(
                                        "Open Article",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xFF525764),
                                        ),
                                      ),
                                      onTap: () =>
                                          launch("https://www.google.com"),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: ListView(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 17, left: 17, right: 13),
                                  child: Text(
                                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minim",
                                    style:
                                        TextStyle(height: 1.3, fontSize: 20.0),
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

  const Journal({Key key, @required this.journalEntry}) : super(key: key);

  @override
  _JournalState createState() => _JournalState(journalEntry);
}

class _JournalState extends State<Journal> {
  final JournalEntry journalEntry;
  _JournalState(this.journalEntry);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return _ArticleView();
          },
        ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(image: AssetImage('img/Capture.PNG')),
            ),
          ),
          Positioned(
            top: 5,
            left: 15,
            child: Text(
              "10",
              style: TextStyle(
                color: Color(0xFF525764),
                fontWeight: FontWeight.bold,
                fontSize: 34.0,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Text(
              "10:20 am",
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
