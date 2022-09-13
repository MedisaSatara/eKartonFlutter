import 'dart:convert';

class Terapija{
  final terapijaId;
  final String nazivLijekova;
  final String uputa;
  //final DateTime od;
  //final DateTime dO;
  final String podsjetnik;

  Terapija({
    this.terapijaId,
    this.nazivLijekova,
    this.uputa,
    //this.od,
    //this.dO,
    this.podsjetnik
  });

  factory Terapija.fromJson(Map<String,dynamic>json){
    return Terapija(
        terapijaId:int.parse(json["terapijaId"].toString()),
        nazivLijekova: json["nazivLijekova"],
        uputa: json["uputa"],
        //od: json["od"],
        //do: json["do"],
        podsjetnik: json["podsjetnik"]
    );
  }
  Map<String,dynamic> toJson() => {
    "terapijaId":terapijaId,
    "nazivLijekova":nazivLijekova,
    "uputa":uputa,
    "podsjetnik":podsjetnik
  };
}
