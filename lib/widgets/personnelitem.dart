class PersonnelItem {
  int id;
  int numberRegister;
  String firstName;
  String lastName;
  String function;
  String direction;
  String directionSic;
  String site;
  int numGFU;
  int num;
  int numExterior;
  String email;



  PersonnelItem(
      this.id,
        this.numberRegister,
        this.lastName,
        this.firstName,
        this.function,
        this.direction,
        this.directionSic,
        this.site,
        this.numGFU,
        this.num,
        this.numExterior,
        this.email);

}

class Functions {
  String funct;
  String direction;
  String directionSic;
  String site;

  Functions(
      {this.funct,
        this.direction,
        this.directionSic,
        this.site,});

  Functions.fromJson(Map<String, dynamic> json) {
    funct = json['fonction'];
    direction = json['direction'];
    directionSic = json['directionsic'];
    site = json['site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['funct'] = this.funct;
    data['direction'] = this.direction;
    data['directionSic'] = this.directionSic;
    data['site'] = this.site;
    return data;
  }
}

class Contacts {
  String number;
  String tel;
  String exteriorNumber;
  String email;

  Contacts(
      {this.number,
        this.tel,
        this.exteriorNumber,
        this.email});

  Contacts.fromJson(Map<String, dynamic> json) {
    number = json['numGFU'];
    tel = json['num'];
    exteriorNumber = json['numExterieur'];
    email = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['tel'] = this.tel;
    data['exteriorNumber'] = this.exteriorNumber;
    data['email'] = this.email;
    return data;
  }
}

class Biography {
  String lastName;
  String firstName;
  String registerNumber;

  Biography(
      {this.lastName,
        this.firstName,
        this.registerNumber});

  Biography.fromJson(Map<String, dynamic> json) {
    lastName = json['nom'];
    firstName = json['prenom'];
    registerNumber = json['matricul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['registerNumber'] = this.registerNumber;
    return data;
  }
}



class Images {
  String xs;
  String sm;
  String md;
  String lg;

  Images({this.xs, this.sm, this.md, this.lg});

  Images.fromJson(Map<String, dynamic> json) {
    xs = 'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/xs/1-a-bomb.jpg';
    sm = 'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/sm/1-a-bomb.jpg';
    md = 'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/md/1-a-bomb.jpg';
    lg = 'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/1-a-bomb.jpg';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xs'] = this.xs;
    data['sm'] = this.sm;
    data['md'] = this.md;
    data['lg'] = this.lg;
    return data;
  }
}
