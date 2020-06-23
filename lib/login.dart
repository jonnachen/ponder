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
  String mode = 'login';
  bool error = false;
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
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
      final user = User.fromJson(jsonDecode(storedUser));
      Navigator.pushNamed(context, '/home', arguments: user);
    }
  }

  void toggleMode() {
    String newMode = mode == 'login' ? 'signup' : 'login';
    setState(() {
      mode = newMode;
    });
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

  Future<User> createUser() async {
    final username = nameController.text.trim();
    final password = passwordController.text.trim();
    final passwordRepeat = passwordRepeatController.text.trim();

    if (password != passwordRepeat) {
      throw Exception('Passwords do not match.');
    }
    final http.Response response = await http.post(
      routes.path + 'users/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body)['user']);
    } else {
      setState(() {
        error = true;
      });
      throw Exception('Failed to load user');
    }
  }

  Future<Null> login() {
    setState(() {
      loading = true;
    });
    getUser().then((user) async {
      // Save the user locally on the device
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jsonUser = jsonEncode(user);
      prefs.setString('user', jsonUser);

      Navigator.pushNamed(context, '/home', arguments: user);
    }).catchError((err) {
      print(err);

      setState(() {
        loading = false;
        error = true;
      });
    });
  }

  Future<Null> signup() {
    setState(() {
      loading = true;
    });
    createUser().then((user) async {
      // Save the user locally on the device
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jsonUser = jsonEncode(user);
      prefs.setString('user', jsonUser);

      Navigator.pushNamed(context, '/home', arguments: user);
    }).catchError((err) {
      setState(() {
        loading = false;
        error = true;
      });
      print(err);
    });
  }

  /*Future<Null> logout() async {
    print("logging out");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //remove the user from shared preferences, logging out if this is successful
    preferences.remove('user').then((removed) =>
        removed ??
        setState(() {
          user = null;
          loggedIn = false;
        }));
  }*/

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
            loading
                ? CircularProgressIndicator()
                : (!loggedIn
                    ? new Column(children: [
                        TextField(
                          textAlign: TextAlign.center,
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Please enter your username'),
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Please enter your password'),
                        ),
                        if (mode == 'signup')
                          TextField(
                            textAlign: TextAlign.center,
                            controller: passwordRepeatController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Please re-enter your password'),
                          ),
                      ])
                    : Text('You are logged in')),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () => {mode == 'login' ? login() : signup()},
              child: mode == 'login' ? Text('Login') : Text('Signup'),
            ),
            FlatButton(
              onPressed: () => {toggleMode()},
              child: mode == 'login' ? Text('or  signup') : Text('or login'),
            )
          ],
        ),
      ),
    );
  }
}
