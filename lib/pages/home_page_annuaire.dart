import 'package:flutter/material.dart';
import 'package:app_lonase/services/fetch_works.dart';
import 'package:app_lonase/widgets/app_background.dart';
import 'package:app_lonase/widgets/app_gradient.dart';
import 'package:app_lonase/widgets/personnel_card.dart';

import 'home.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0XFF29D091),
        title: Text(
          "ANNUAIRE",
          style: TextStyle(
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backgroundImage,
          Container(
            decoration: gradient,
            child: FutureBuilder<List>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text('No data found!');
                  return snapshot.hasData
                      ? _buildItem(snapshot.data)
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(List list) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return PersonnelCard(
            id: list[index]['id'] ?? '',
            registrationNumber: list[index]['matricul'] ?? '',
            lastName: list[index]['nom'] ?? '',
            firstName: list[index]['prenom'] ?? '',
            function: list[index]['fonction'] ?? '',
            direction: list[index]['direction'] ?? '',
            site: list[index]['site'] ?? '',
            numGFU: list[index]['numGFU'] ?? '',
            num: list[index]['num'] ?? '',
            numExt: list[index]['numExterieur'] ?? '',
            email: list[index]['mail'] ?? '',
            img:
                'https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/p240x240/23473250_1564409043618569_7552026323907165871_n.jpg?_nc_cat=106&_nc_oc=AQlSDjVvveIgdOxSPxRHq7qkvU3XPwT6BJhmdd5I79FOs9n7jQIwYlgSPxoe_gszagQ&_nc_ht=scontent-lga3-1.xx&oh=af1b17c543aa14bb2c83a32578b6db27&oe=5E6074C1' ??
                    '',
            directionSic: list[index]['directionsic'] ?? '');
      },
    );
  }
}
