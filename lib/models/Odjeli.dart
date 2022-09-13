import 'dart:convert';

import 'package:flutter/material.dart';
class Odjeli{
  final int odjelId;
  final String naziv;
  final String telefon;


  Odjeli({
    this.odjelId,
    this.naziv,
    this.telefon
  });

  factory Odjeli.fromJson(Map<String, dynamic> json){
    return Odjeli(
        odjelId:int.parse(json["odjelId"].toString()),
        naziv: json["naziv"],
        telefon: json["telefon"]
    );
  }

  Map<String, dynamic> toJson() => {
    "odjelId": odjelId,
    "naziv": naziv,
    "telefon": telefon
  };
}
