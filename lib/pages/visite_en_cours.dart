import 'package:app_lonase/widgets/visit_card.dart';
import 'package:flutter/material.dart';
import 'package:app_lonase/services/fetch_visit.dart';
import 'package:app_lonase/widgets/app_background.dart';
import 'package:app_lonase/widgets/app_gradient.dart';

import 'home_page_visite.dart';
import 'login_page.dart';

class VisitEnCours extends StatefulWidget {
  VisitEnCours({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VisitEnCoursState createState() => _VisitEnCoursState();
}

class _VisitEnCoursState extends State<VisitEnCours> {
  int _bottomNavIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0XFF29D091),
        title: Text(
          "Visites en cours".toUpperCase(),
          style: TextStyle(color: Color(0XFFFFFFFF)),
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
                future: fetchDataVisitEnCours(),
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
        return VisitCard(
            id: list[index]['id'] ?? '',
            lastName: list[index]['nom_visiteur'] ?? '',
            firstName: list[index]['prenom_visiteur'] ?? '',
            direction: list[index]['direction'] ?? '',
            zone: list[index]['zone_visite'] ?? '',
            type: list[index]['type_visite'] ?? '',
            dateTime: list[index]['date_visite'] ?? '');
      },
    );
  }
}
