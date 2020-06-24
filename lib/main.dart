import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'archive.dart';
import 'account.dart';
import 'homepage.dart';
import 'login.dart';
import 'classes/user.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Ponder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SF Pro'),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the Login widget.
          '/': (context) => Login(),
          // When navigating to the "/second" route, build the bottom navigation widget.
          '/home': (context) => CupertinoStoreApp(),
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
                child: AccountTab(user: user),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
