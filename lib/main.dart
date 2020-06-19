import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'archive.dart';
import 'account.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Ponder',
        theme: ThemeData(fontFamily: 'SF Pro'),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the Login widget.
          '/': (context) => Login(),
          // When navigating to the "/second" route, build the bottom navigation widget.
          '/home': (context) => MyBottomNavigationBar(),
        }
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  bool loggedIn  = false;
  TextEditingController nameController = TextEditingController();

  @override
  void initState(){
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String user = prefs.getString('user');

    if (user != null){
      setState(() {
        loggedIn = true;
        user;
      });
      return;
    }
  }

  Future<Null> login(){
    print("if I actually had this set up, this would log the  user in");
  }

  Future<Null> logout(){
    print("if I actually had this set up, this would log the  user out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Login Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !loggedIn ? TextField(
              textAlign: TextAlign.center,
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Please enter your name'),
            ) : Text('You are logged in'),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                loggedIn ? logout() : login();                
              },
              child: loggedIn ? Text('Logout') : Text('Login'),
            )
          ],
        ),
      ), 
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Login(),
    Archive(),
    Account(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff52E3D2),
        unselectedItemColor: Colors.grey[500],
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Add")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.history), title: new Text("Archive")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle), title: new Text("Account")),
        ],
      ),
    );
  }
}
