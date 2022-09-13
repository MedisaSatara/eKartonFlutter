import 'dart:convert';

class Termin{
  final terminId;
  final String datum;
  final String vrijeme;
  final String razlog;
  final int pacijentId;

  Termin({
    this.terminId,
    this.datum,
    this.vrijeme,
    this.razlog,
    this.pacijentId
  });

  factory Termin.fromJson(Map<String,dynamic>json){
    return Termin(
        terminId:int.parse(json["terminId"].toString()),
        datum: json["datum"],
        vrijeme: json["vrijeme"],
        razlog: json["razlog"],
        pacijentId:int.parse(json["pacijentId"].toString())
    );
  }
  Map<String,dynamic> toJson() => {
    "terminId":terminId,
    "datum":datum,
    "vrijeme":vrijeme,
    "razlog":razlog,
    "pacijentId":pacijentId
  };
}
