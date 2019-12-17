import 'package:flutter/material.dart';

final gradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5, 0.7, 0.9],
    colors: [
      Color(0XFF29D091),
      Color(0XFF29D091),
      Color(0XFF29D091),
      Color(0XFF29D091),
    ],
  ),
);