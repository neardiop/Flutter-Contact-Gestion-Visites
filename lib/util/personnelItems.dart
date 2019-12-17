class PersonnelItem {
  int id;
  int numRegister;
  String firstName;
  String lastName;
  String function;
  String direction;
  String directionSic;
  String site;
  int numGFU;
  int num;
  int numExterior;
  String mail;

  PersonnelItem(
      {this.id,
      this.numRegister,
      this.firstName,
      this.lastName,
      this.function,
      this.direction,
      this.directionSic,
      this.site,
      this.numGFU,
      this.num,
      this.numExterior,
      this.mail});

  PersonnelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numRegister = json['matricul'];
    lastName = json['nom'];
    firstName = json['prenom'];
    function = json['fonction'];
    direction = json['direction'];
    directionSic = json['directionSic'];
    site = json['site'];
    numGFU = json['numGFU'];
    num = json['num'];
    numExterior = json['numExterieur'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricul'] = this.numRegister;
    data['prenom'] = this.firstName;
    data['nom'] = this.lastName;
    data['fonction'] = this.function;
    data['direction'] = this.direction;
    data['directionSic'] = this.directionSic;
    data['site'] = this.site;
    data['numGFU'] = this.numGFU;
    data['num'] = this.num;
    data['numExterieur'] = this.numExterior;
    data['mail'] = this.mail;
    return data;
  }
}
