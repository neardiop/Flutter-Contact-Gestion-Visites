import 'package:app_lonase/pages/detail_personnel.dart';
import 'package:app_lonase/pages/save_information_visitor.dart';
import 'package:flutter/material.dart';

class VisitCard extends StatelessWidget {
  var id;
  String lastName;
  String firstName;
  String direction;
  String zone;
  String type;
  String dateTime;

  VisitCard(
      {this.id,
      this.lastName,
      this.firstName,
      this.direction,
      this.zone,
      this.type,
      this.dateTime});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterVisitorInformation(idUser : id)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      // color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "$firstName $lastName",
                            style: textTheme.title,
                          ),
                          Padding(padding: const EdgeInsets.all(3.0)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.center_focus_strong,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "$direction",
                                style: textTheme.caption,
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Icon(
                                Icons.directions,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "$zone",
                                style: textTheme.caption,
                              ),
                            ],
                          ),
                          Padding(padding: const EdgeInsets.all(3.0)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.av_timer,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "$dateTime",
                                style: textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
