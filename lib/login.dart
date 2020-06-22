import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'classes/user.dart';
import 'constants/routes.dart' as routes;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loggedIn = false;
  bool error = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User user;

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUser = prefs.getString('user');

    if (storedUser != null) {
      setState(() {
        loggedIn = true;
        user = User.fromJson(json.decode(storedUser));
      });
      return;
    }
  }

  Future<User> getUser() async {
    final username = nameController.text;
    final password = passwordController.text;
    final http.Response response = await http.post(
      routes.path + 'users/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body)['user']);
    } else {
      setState(() {
        error = true;
      });
      throw Exception('Failed to load user');
    }
  }

  Future<Null> login() {
    getUser().then((user) async {
      print("success!");

      // Save the user locally on the device
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jsonUser = jsonEncode(user);
      prefs.setString('user', jsonUser);

      Navigator.pushNamed(context, '/home', arguments: user);
    }).catchError((err) {
      print(err);
      print("error :(");
    });
  }

  Future<Null> logout() async {
    print("logging out");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //remove the user from shared preferences, logging out if this is successful
    preferences.remove('user').then((removed) =>
        removed ??
        setState(() {
          user = null;
          loggedIn = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !loggedIn
                ? new Column(children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Please enter your usernname'),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Please enter your password'),
                    )
                  ])
                : Text('You are logged in'),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                login();
              },
              child: loggedIn ? Text('Logout') : Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
