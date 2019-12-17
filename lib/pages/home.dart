import 'package:flutter/material.dart';
import 'home_page_annuaire.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0XFF29D091)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0XFF29D091),
                        radius: 100.0,
                        child: Image.asset(
                          "images/lonase.png",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Loterie Nationale Sénégalaise",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
