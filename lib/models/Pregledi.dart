import 'dart:convert';

class Pregledi{
  final int pregledId;
  final String datum;
  final String razlogPosjete;
  final String dijagnoza;
  final pacijentId;

  Pregledi({
    this.pregledId ,
    this.datum,
    this.razlogPosjete,
    this.dijagnoza,
    this.pacijentId
  });

  factory Pregledi.fromJson(Map<String,dynamic>json){
    return Pregledi(
        pregledId:int.parse(json["pregledId"].toString()),
        datum: json["datum"],
        razlogPosjete: json["razlogPosjete"],
        dijagnoza: json["dijagnoza"],
        pacijentId: int.parse(json["pacijentId"].toString())
    );
  }
  Map<String,dynamic> toJson() => {
    "pregledId":pregledId,
    "datum":datum,
    "razlogPosjete":razlogPosjete,
    "dijagnoza":dijagnoza,
    "pacijentId":pacijentId
  };
}
