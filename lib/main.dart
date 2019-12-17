import 'package:app_lonase/pages/home.dart';
import 'package:app_lonase/pages/home_page_annuaire.dart';
import 'package:app_lonase/pages/login_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  int _selectedTab = 0;
  final _pageOptions = [
    MyHomePage(),
    HomePage(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color(0XFF29D091),
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Acceuil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text('Annuaire'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              title: Text('Visite'),
            ),
          ],
        ),
      ),
    );
  }}