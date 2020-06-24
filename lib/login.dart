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
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors:[Color(0xFFB8F2E5), Color(0xFFC2F9BB)]
              ),
            ),
            child: Stack(
              children:<Widget>[

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      loading
                          ? CircularProgressIndicator()
                          : (!loggedIn
                          ? new Column(children: [
                        Padding(
                          padding: EdgeInsets.only(left:250),
                          child: Container(
                            child: Image(
                              width: 60,
                              height: 60,
                              image: AssetImage('img/home_leaf.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 230, bottom: 5),
                          child: Text("username",
                            style: TextStyle(
                              fontSize:26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width:350,
                          height: 40,
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xFF525764),
                              fontSize:17,
                            ),
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom:3, left:15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(60)),
                                  borderSide: BorderSide(color: Colors.white, width: 4,)
                              ),
                              //hintText: 'Please enter your username'
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 230, top:15, bottom: 5),
                          child: Text("password",
                            style: TextStyle(
                              fontSize:26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 40,
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom:3, left: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(60)),
                                  borderSide: BorderSide(color: Colors.white, width: 4,)
                              ),
                              //hintText: 'Please enter your username'
                            ),
                          ),
                        ),


                        if (mode == 'signup')
                          Stack(
                            children:<Widget>[
                              Padding(
                                  padding:EdgeInsets.only(left:6, top:15, bottom:7),
                                  child: Text("confirm password",
                                    style: TextStyle(
                                      fontSize:26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),)
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:50),
                                child: Container(
                                  width: 350,
                                  height: 40,
                                  child: TextField(
                                    controller: passwordRepeatController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom:3, left: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(60)),
                                          borderSide: BorderSide(color: Colors.white, width: 4,)
                                      ),
                                      //hintText: 'Please enter your username'
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                      ])
                          : Text('You are logged in')),
                      SizedBox(height: 10.0),
                      FlatButton(
                        onPressed: () => {mode == 'login' ? login() : signup()},
                        child: mode == 'login' ? Padding(
                          padding: EdgeInsets.only(top:20),
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius:7,
                                    offset:Offset(2.5,4),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(70))
                            ),
                            child:Center(
                                child: Text("login",
                                  style:TextStyle(
                                    fontSize:28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF525764),
                                  ),)
                            ),
                          ),
                        ) : Padding(
                          padding: EdgeInsets.only(top:20),
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius:7,
                                    offset:Offset(2.5,4),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(70))
                            ),
                            child:Center(
                                child: Text("signup",
                                  style:TextStyle(
                                    fontSize:28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF525764),
                                  ),)
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () => {toggleMode()},
                        child: mode == 'login' ? Padding(
                          padding: EdgeInsets.only(top:1),
                          child: Text('or signup',
                              style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF525764),
                              )),
                        ) : Padding(
                          padding: EdgeInsets.only(top:1),
                          child: Text('or login',
                              style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF525764),
                              )),
                        ),
                      )
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
