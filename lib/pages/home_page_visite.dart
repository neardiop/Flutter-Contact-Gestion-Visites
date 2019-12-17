import 'package:app_lonase/pages/visite_past.dart';
import 'package:app_lonase/widgets/visit_card.dart';
import 'package:flutter/material.dart';
import 'package:app_lonase/services/fetch_visit.dart';
import 'package:app_lonase/widgets/app_background.dart';
import 'package:app_lonase/widgets/app_gradient.dart';

import 'create_visite.dart';
import 'home.dart';
import 'login_page.dart';

class HomePageVisitor extends StatefulWidget {
  HomePageVisitor({Key key, this.title}) : super(key: key);

  final String title;
  var id = 2;

  @override
  _HomePageVisitorState createState() => _HomePageVisitorState();
}

class _HomePageVisitorState extends State<HomePageVisitor> {
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
          "Visites à venir".toUpperCase(),
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
                future: fetchDataVisit(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text('No data found!');
                  return snapshot.hasData
                      ? _buildItem(snapshot.data)
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateVisite(idUser: widget.id,)),
          );
        },
        tooltip: 'Add post',
        backgroundColor: Color(0XFF29D091),
        child: Icon(Icons.add),
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
