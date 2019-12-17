import 'package:flutter/material.dart';

Widget buildLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Text(
        "Gestion des\n visites",
        style: TextStyle(fontSize: 40.0),
        textAlign: TextAlign.center,
      ),
    ],
  );
}