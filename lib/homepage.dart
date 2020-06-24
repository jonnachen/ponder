import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'classes/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'classes/journalEntry.dart';
import 'classes/article.dart';
import 'constants/routes.dart' as routes;
import 'utils.dart' as utils;

class HomepageTab extends StatefulWidget {
  final User user;

  const HomepageTab({Key key, @required this.user}) : super(key: key);

  @override
  _HomepageTabState createState() {
    return _HomepageTabState(user);
  }
}

class _HomepageTabState extends State<HomepageTab> {
  final User user;
  _HomepageTabState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD4FFFF), body: _AddEntryView(user: user));
  }
}

class _AddEntryView extends StatefulWidget {
  final User user;

  const _AddEntryView({Key key, @required this.user}) : super(key: key);
  @override
  _AddEntryViewState createState() => _AddEntryViewState();
}

class _AddEntryViewState extends State<_AddEntryView> {
  TextEditingController entryController = TextEditingController();
  bool error = false;
  bool loading = false;

  Future<JournalEntry> createJournalEntry(user) async {
    final text = entryController.text;
    setState(() {
      loading = true;
    });

    final http.Response response = await http.post(
      routes.path + 'journals/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user': user.id,
        'text': text,
      }),
    );
    if (response.statusCode == 200) {
      print("success");
      var article = Article.fromJson(json.decode(response.body)['article']);
      var journal =
          JournalEntry.fromJson(json.decode(response.body)['journal'], article);
      print('am here');
      return journal;
    } else {
      setState(() {
        loading = false;
        error = true;
      });
      throw new Exception("Unable to submit journal entry.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final user = widget.user;

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
                                child: Text('Hi ${user.username}!',
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
                            child: Text(
                                '${utils.formatDate(currentDate)} | ${utils.formatTime(currentDate)}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0))),
                        Container(
                            width: 300.0,
                            height: 400.0,
                            child: TextField(
                                controller: entryController,
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
                right: 30,
                bottom: 20,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    //store entry here
                    createJournalEntry(user).then((journalEntry) {
                      print("i am here");
                      Navigator.of(context).push(CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return _ArticleView(
                              user: user,
                              article: journalEntry.article,
                              journalEntry: journalEntry);
                        },
                      ));
                    });
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
  final User user;
  final Article article;
  final JournalEntry journalEntry;

  _ArticleView(
      {Key key,
      @required this.user,
      @required this.article,
      @required this.journalEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building");
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFFD4FFFF),
        child: Stack(
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
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
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
                      child: Text("${article.title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                              color: Color(0XFF5E6472))))),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 20),
                  child: Text(
                    "${article.url}",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0x44CEC9),
                    ),
                  ),
                ),
              ),
              Container(
                  color: Colors.white,
                  height: 2000.0,
                  child: //ListView(children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 30, right: 20),
                          child: WebView(
                              initialUrl: article.url,
                              javascriptMode: JavascriptMode.unrestricted))
                  /*])*/)
            ]),
            Positioned(
                right: 30,
                bottom: 20,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    //store entry here

                    //navigate to new page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _EndView(
                                user: user,
                                article: article,
                                journalEntry: journalEntry)));
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

class _EndView extends StatefulWidget {
  final User user;
  final Article article;
  final JournalEntry journalEntry;

  const _EndView(
      {Key key,
      @required this.user,
      @required this.article,
      @required this.journalEntry})
      : super(key: key);

  @override
  _EndViewState createState() {
    return _EndViewState();
  }
}

class _EndViewState extends State<_EndView> {
  bool loading = false;
  bool isFavorite = false;

  favorite(journalEntry, user) async {
    final http.Response response = await http.put(
      routes.path + 'users/${user.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'journalEntry': journalEntry}),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body)['user']);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = widget.user;
    final Article article = widget.article;
    final JournalEntry journalEntry = widget.journalEntry;
    setState(() {
      isFavorite = journalEntry.favorited;
    });
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFFD4FFFF),
        child: Stack(
          children: <Widget>[
            ListView(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Text("Today is ${utils.formatDate(DateTime.now())}.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF525764),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0))),
              Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
                  child: Text(
                      "Hope you have a great day today! Feel free to write another entry.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFF525764), fontSize: 20.0))),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 50, right: 15),
                          child: FlatButton(
                            onPressed: () {
                              favorite(user, journalEntry);
                            },
                            child: Image(
                                width: 25,
                                height: 25,
                                image: isFavorite
                                    ? AssetImage('img/filled_star.png')
                                    : AssetImage('img/star.png')),
                          ),
                        ),
                        Text("${utils.formatDate(journalEntry.createdAt)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(0xffFAF3DD),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      child: Center(
                          child: Text(article.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xff5E6472)))))),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 100, right: 100),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return _AddEntryView(user: user);
                      },
                    ));
                  },
                  color: Colors.white,
                  textColor: Color(0xff1A782E),
                  child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("+ New Entry",
                          style: TextStyle(fontSize: 20.0))),
                ),
              )
            ]),
            Positioned(
                bottom: 0,
                left: 290,
                child: Image(image: AssetImage('img/article_leaf.png')))
          ],
        ));
  }
}
