import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp (
        theme:ThemeData(primaryColor:Colors.green[500]),
        home: HomeScreen());
  }

}

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int currentIndex = 0;
  Widget childWidget = ChildWidget(
    number: AvailableNumber.First,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ponder", style: TextStyle(color: Colors.white)),
        centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;

          switch (value) {
            case 0:
              childWidget = ChildWidget(number: AvailableNumber.First);
              break;
            case 1:
              childWidget = ChildWidget(number: AvailableNumber.Second);
              break;
            case 2:
              childWidget = ChildWidget(number: AvailableNumber.Third);
              break;
            case 3:
              childWidget = ChildWidget(number: AvailableNumber.Forth);
              break;
          }

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Journal"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Mood Tracker"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Articles"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: childWidget,
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final AvailableNumber number;

  const ChildWidget({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String file = "";
    if (number == AvailableNumber.First) {
      file = "first";
    } else if (number == AvailableNumber.Second) {
      file = "second";
    } else if (number == AvailableNumber.Third){
      file = "third";
    } else {
      file = "forth";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$file screen",
          style: TextStyle(fontSize: 36.0),
        ),
      ],
    );
  }
}

enum AvailableNumber { First, Second, Third, Forth }



