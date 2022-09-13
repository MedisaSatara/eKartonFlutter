import 'package:flutter/material.dart';
class Korisnik {
  final KorisnikId;
  final String Ime;
  final String Prezime;
  final String KorisnickoIme;
  final String Lozinka;


  Korisnik({
    this.KorisnikId,
    this.Ime,
    this.Prezime,
    this.KorisnickoIme,
    this.Lozinka
  });

  factory Korisnik.fromJson(Map<String,dynamic>json){
    return Korisnik(
        KorisnikId:["KorisnikId"],
        Ime: json ["Ime"],
        Prezime: json ["Prezime"],
        KorisnickoIme: json ["KorisnickoIme"],
        Lozinka: json ["Lozinka"]

    );}

  Map<String,dynamic>toJson()=> {
    "KorisnikId": KorisnikId,
    "Ime": Ime,
    "Prezime": Prezime,
    "KorisnickoIme": KorisnickoIme,
    "Lozinka":Lozinka
  };

}
