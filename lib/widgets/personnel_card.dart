import 'package:app_lonase/pages/detail_personnel.dart';
import 'package:app_lonase/widgets/superhero_avatar.dart';
import 'package:flutter/material.dart';

class PersonnelCard extends StatelessWidget {
  var id;
  var registrationNumber;
  String lastName;
  String firstName;
  String function;
  String direction;
  String directionSic;
  String site;
  var numGFU;
  var tel;
  var num;
  var numExt;
  String email;

  var img;

  PersonnelCard(
      {this.id,
      this.registrationNumber,
      this.lastName,
      this.firstName,
      this.function,
      this.direction,
      this.directionSic,
      this.site,
      this.numGFU,
      this.num,
      this.numExt,
      this.email,
      this.img});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(
              img: img, id: id,numRegister: registrationNumber, firstName: firstName, lastName: lastName,
          function: function,direction: direction,directionSic: directionSic,site: site,numGFU: numGFU,
          num: num,numExterior: numExt,mail: email,);
        });

        Navigator.of(context).push(router);
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
                  SizedBox(
                    width: 12.0,
                  ),
                  SuperheroAvatar(img: img),
                  SizedBox(
                    width: 24.0,
                  ),
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
                          Text(
                            direction.isEmpty ? direction : direction,
                            style: textTheme.subtitle.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.center_focus_strong,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "$directionSic",
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
