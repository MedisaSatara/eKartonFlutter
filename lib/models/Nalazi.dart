import 'dart:convert';
import 'dart:ffi';

class Pacijent{
  final pacijentId;
  final String ime;
  final String prezime;
  final String spol;
  final String datumRodjenja;
  final String mjestoRodjenja;
  final String jmbg;
  final String telefon;
  final String prebivaliste;
  final String krvnaGrupa;
  final String rhFaktor;
  final String hronicneBolesti;
  //final Bool koagulopatije;
  final String brojKartona;
  final String korisnickoIme;
  final String alergican;

  Pacijent({
    this.pacijentId,
    this.ime,
    this.prezime,
    this.datumRodjenja,
    this.spol,
    this.jmbg,
    this.alergican,
    this.brojKartona,
    this.hronicneBolesti,
    //this.koagulopatije,
    this.krvnaGrupa,
    this.korisnickoIme,
    this.mjestoRodjenja,
    this.prebivaliste,
    this.rhFaktor,
    this.telefon
  });

  factory Pacijent.fromJson(Map<String,dynamic>json){
    return Pacijent(
        pacijentId:int.parse(json["pacijentId"].toString()),
        ime: json["ime"],
        prezime: json["prezime"],
        spol: json["spol"],
        datumRodjenja: json["datumRodjenja"],
        jmbg: json["jmbg"],
        mjestoRodjenja: json["mjestoRodjenja"],
        prebivaliste: json["prebivaliste"],
        alergican: json["alergican"],
        //koagulopatije: bool["koagulopatije"].toString(),
        rhFaktor: json["rhFaktor"],
        korisnickoIme: json["korisnickoIme"],
        krvnaGrupa: json["krvnaGrupa"],
        hronicneBolesti: json["hronicneBolesti"],
        telefon: json["telefon"],
        brojKartona: json["brojKartona"]
    );
  }
  Map<String,dynamic> toJson() => {
    "pacijentId":pacijentId,
    "brojKartona":brojKartona,
    "ime":ime,
    "prezime":prezime,
    "datumRodjenja":datumRodjenja,
    "spol":spol,
    "jmbg":jmbg,
    "alergican":alergican,
    "brojKartona":brojKartona,
    "hronicneBolesti":hronicneBolesti,
    //"koagulopatije":koagulopatije,
    "krvnaGrupa":krvnaGrupa,
    "korisnickoIme":korisnickoIme,
    "mjestoRodjenja":mjestoRodjenja,
    "prebivaliste":prebivaliste,
    "rhFaktor":rhFaktor,
    "telefon":telefon
  };
}
