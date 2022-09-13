import 'dart:convert';

class Doktor{
  final doktorId;
  final String ime;
  final String prezime;
  final String spol;
  final String grad;
  final String jmbg;
  final String telefon;
  final String email;
  final String datumRodjenja;
  final int odjelId;


  Doktor({
    this.doktorId ,
    this.ime,
    this.prezime,
    this.datumRodjenja,
    this.spol,
    this.jmbg,
    this.email,
    this.grad,
    this.telefon,
    this.odjelId
  });

  factory Doktor.fromJson(Map<String,dynamic>json){
    return Doktor(
        doktorId:int.parse(json["doktorId"].toString()),
        ime: json["ime"],
        prezime: json["prezime"],
        spol: json["spol"],
        datumRodjenja: json["datumRodjenja"],
        jmbg: json["jmbg"],
        grad: json["grad"],
        email: json["email"],
        telefon: json["telefon"],
        odjelId: json["odjelId"]
    );
  }
  Map<String,dynamic> toJson() => {
    "doktorId":doktorId,
    "ime":ime,
    "prezime":prezime,
    "datumRodjenja":datumRodjenja,
    "spol":spol,
    "jmbg":jmbg,
    "grad":grad,
    "email":email,
    "telefon":telefon,
    "odjelId":odjelId
  };
}
