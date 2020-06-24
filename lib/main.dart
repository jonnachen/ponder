import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'archive.dart';
import 'account.dart';
import 'homepage.dart';
import 'login.dart';
import 'classes/user.dart';

void main() {
  return runApp(MyApp());
}

void goToHome(context) {
  Navigator.pushNamed(context, '/home');
}

Future<Null> logout(context) async {
  print("logging out");
  SharedPreferences preferences = await SharedPreferences.getInstance();
  //remove the user from shared preferences, logging out if this is successful
  preferences.remove('user').then((removed) {
    if (removed) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Ponder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SF Pro'),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return CupertinoPageRoute(
                  builder: (_) => Login(goToHome: goToHome),
                  settings: settings);
            case '/home':
              return CupertinoPageRoute(
                  builder: (_) => CupertinoStoreApp(), settings: settings);
            default:
              return CupertinoPageRoute(
                  builder: (_) => Login(goToHome: goToHome),
                  settings: settings);
          }
        });
  }
}

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final User user = ModalRoute.of(context).settings.arguments;

    return CupertinoApp(home: CupertinoStoreHomePage(user: user));
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  final User user;

  const CupertinoStoreHomePage({Key key, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color(0xFF3FCCCC),
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add)),
          BottomNavigationBarItem(icon: Icon(Icons.book)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomepageTab(user: user),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ArchiveTab(user: user),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AccountTab(user: user, logout: logout),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
