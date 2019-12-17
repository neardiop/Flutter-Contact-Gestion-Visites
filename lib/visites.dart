import 'package:app_lonase/pages/home.dart';
import 'package:app_lonase/pages/home_page_annuaire.dart';
import 'package:app_lonase/pages/home_page_visite.dart';
import 'package:app_lonase/pages/login_page.dart';
import 'package:app_lonase/pages/visite_en_cours.dart';
import 'package:app_lonase/pages/visite_past.dart';
import 'package:flutter/material.dart';

class MyAppVisite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppVisiteState();
  }
}
class MyAppVisiteState extends State<MyAppVisite> {
  int _selectedTab = 0;
  final _pageOptions = [
    HomePageVisitor(),
    VisitEnCours(),
    PastVisit(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color(0XFF29D091),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              title: Text('Visites à venir'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on),
              title: Text('Visites en cours'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_off),
              title: Text('Visites passées'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              title: Text('Déconnexion'),
            ),
          ],
        ),
      ),
    );
  }}