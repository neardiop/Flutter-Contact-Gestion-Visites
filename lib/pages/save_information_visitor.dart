import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class RegisterVisitorInformation extends StatefulWidget {
  var idUser;
  RegisterVisitorInformation({Key key, this.idUser}) : super(key: key);
  @override
  _RegisterVisitorInformationState createState() => new _RegisterVisitorInformationState();
}

class _RegisterVisitorInformationState extends State<RegisterVisitorInformation> {
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
            new Text('Informations enregistrées avec succès'),
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

  var _typePieceController = new TextEditingController();
  var _numberofPieceController = new TextEditingController();
  var _infoBadgeController = new TextEditingController();
  var _commentaireController = new TextEditingController();

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void _addData() {
    var url = "http://192.168.0.10/fluttertest/saveInformationVisitor.php";
    http.post(url, body: {
      "iduser": widget.idUser,
      "typePiece": _typePieceController.text,
      "numberPiece": _numberofPieceController.text,
      "infoBadge": _infoBadgeController.text,
      "commentaire": _commentaireController.text,
    });
    showToast("Informations enregistrées avec succès", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF29D091),
        title: new Text("Saisir les informations"),
      ),
      body: new Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
        child: ListView(
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.credit_card),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Type de piéce: ", hintText: "Type de piéce"),
                controller: _typePieceController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.filter_9_plus),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Numéro du piéce: ", hintText: " Numéro du piéce"),
                controller: _numberofPieceController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.branding_watermark),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Info Badge: ", hintText: "Info Badge"),
                controller: _infoBadgeController,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.textsms),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Commentaire: ", hintText: "Commentaire"),
                controller: _commentaireController,
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