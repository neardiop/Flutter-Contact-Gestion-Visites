import 'dart:convert';
import 'dart:ui';

import 'package:app_lonase/services/select_id.dart';
import 'package:app_lonase/util/personnelItems.dart';
import 'package:app_lonase/widgets/app_gradient.dart';
import 'package:app_lonase/widgets/image_detail.dart';
import 'package:app_lonase/widgets/personnel_card.dart';
import 'package:app_lonase/widgets/superhero_avatar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final title;
  final id;
  final numRegister;
  final img;
  final firstName;
  final lastName;
  final function;
  final direction;
  final directionSic;
  final site;
  final numGFU;
  final num;
  final numExterior;
  final mail;

  Details(
      {Key key,
      this.title,
      this.id,
      this.numRegister,
      this.img,
      this.firstName,
      this.lastName,
      this.function,
      this.directionSic,
      this.direction,
      this.site,
      this.numGFU,
      this.num,
      this.numExterior,
      this.mail})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isLoading = false;
  PersonnelItem personnelItem;

  callAction(String number) async {
    String url = "tel:${number}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not call ${number}';
    }
  }

  smsAction(String number) async {
    String url = "sms:${number}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send sms to ${number}';
    }
  }

  @override
  Widget build(BuildContext context) {
    // wrap screen in WillPopScreen widget
    return Scaffold(
      backgroundColor: Color(0xFFDAE0E2),
      body: Center(
        child: isLoading
            ? Container(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  // header text container
                  Container(child: Padding(padding: const EdgeInsets.all(50))),
                  //name
                  Card(
                    child: new Column(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.all(10)),
                        SizedBox(
                          width: 12.0,
                        ),
                        ImageAvatar(img: widget.img,),
                        Padding(padding: const EdgeInsets.all(10)),
                        new ListTile(
                          leading: new Icon(
                            Icons.account_box,
                            color: Color(0XFF29D091),
                            size: 26.0,
                          ),
                          title: new Text(
                            "${widget.firstName} ${widget.lastName}",
                            style: new TextStyle(fontWeight: FontWeight.w400),
                          ),
                          subtitle: new Text("${widget.function}"),
                        ),
                        new Divider(
                          color: Color(0XFF29D091),
                          indent: 16.0,
                        ),
                        new ListTile(
                          leading: new Icon(
                            Icons.center_focus_strong,
                            color: Color(0XFF29D091),
                            size: 26.0,
                          ),
                          title: new Text(
                            "${widget.direction}",
                            style: new TextStyle(fontWeight: FontWeight.w400),
                          ),
                          subtitle: new Text("${widget.directionSic}"),
                        ),
                        new ListTile(
                          leading: new Icon(
                            Icons.place,
                            color: Color(0XFF29D091),
                            size: 26.0,
                          ),
                          title: new Text(
                            "${widget.site}",
                            style: new TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        new Divider(
                          color: Color(0XFF29D091),
                          indent: 16.0,
                        ),
                        new ListTile(
                          leading: new Icon(
                            Icons.phone,
                            color: Color(0XFF29D091),
                            size: 26.0,
                          ),
                          title: new Text(
                            "${widget.numGFU}",
                            style: new TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        new ListTile(
                          leading: new Icon(
                            Icons.mail,
                            color: Color(0XFF29D091),
                            size: 26.0,
                          ),
                          title: new Text(
                            "${widget.mail}",
                            style: new TextStyle(fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  // call and sms
                  Card(
                    elevation: 10.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.phone),
                              color: Color(0XFF29D091),
                              onPressed: () {
                                callAction(widget.direction);
                              },
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.message),
                              color: Color(0XFF29D091),
                              onPressed: () {
                                smsAction(widget.direction);
                              },
                            )
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
