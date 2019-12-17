
import 'package:app_lonase/pages/home_page_annuaire.dart';
import 'package:app_lonase/pages/login_page.dart';
import 'package:app_lonase/visites.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  '/Login': (BuildContext context) => LoginPage(),
  '/Home': (BuildContext context) => HomePage(title: 'Dashboard'),
  '/HomeVisit': (BuildContext context) => MyAppVisite(),
};