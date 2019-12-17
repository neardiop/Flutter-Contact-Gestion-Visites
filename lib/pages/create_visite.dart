import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import 'package:intl/intl.dart';
import 'dateTime.dart';

class CreateVisite extends StatefulWidget {
  var idUser;

  CreateVisite({Key key, this.idUser}) : super(key: key);

  @override
  _CreateVisiteState createState() => new _CreateVisiteState();
}

class _CreateVisiteState extends State<CreateVisite> {
  final ThemeData _CeTheme = _buildTheme();

  static ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
  }

  void onCreatedAccount() {
    var alert = new AlertDialog(
      title: new Text('Info'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text('Visite créée avec succès'),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, child: alert);
  }

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2025));

    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  var _nomVisiteruController = new TextEditingController();
  var _prenomVisisteurController = new TextEditingController();
  var _directionController = new TextEditingController();
  var _zoneVisiterController = new TextEditingController();
  var _typeVisiteController = new TextEditingController();
  var _dateVisiteController = new TextEditingController();

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void _addData() {
    var url = "http://192.168.0.10/fluttertest/createViste.php";
    http.post(url, body: {
      "id_user": widget.idUser,
      "nom": _nomVisiteruController.text,
      "prenom": _prenomVisisteurController.text,
      "direction": _directionController.text,
      "zone": _zoneVisiterController.text,
      "type": _typeVisiteController.text,
      "date": _dateVisiteController,
    });
    showToast("Visite créée avec succès", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF29D091),
        title: new Text("Enregistrer une visite"),
      ),
      body: new Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
        child: ListView(
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Nom visiteur: ", hintText: "Nom visiteur"),
                controller: _nomVisiteruController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Prénom visiteur: ",
                    hintText: "Prénom visiteur"),
                controller: _prenomVisisteurController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.account_balance),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Direction: ", hintText: "Direction"),
                controller: _directionController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.directions),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Zone à visiter: ", hintText: "Zone à visiter"),
                controller: _zoneVisiterController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.title),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Type de visite: ", hintText: "Type de visite"),
                controller: _typeVisiteController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.date_range),
              title: new RaisedButton(
                  child: new Text('Select Date'),
                  onPressed: () {
                    _selectDate(context);
                  }),
            ),
            new ListTile(
              leading: const Icon(Icons.credit_card),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Date selected: ${_date.toString()}", hintText: "Type de visite"),
                controller: _dateVisiteController,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.white30,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Retour"),
                ),
                new RaisedButton(
                  onPressed: _addData,
                  textColor: Colors.white,
                  color: Color(0XFF29D091),
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Enregistrer",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
