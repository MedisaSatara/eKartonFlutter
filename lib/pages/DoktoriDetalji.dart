import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:ekartonflutter/models/Doktor.dart';
import 'package:flutter/material.dart';

class DoktoriDetalji extends StatelessWidget{
  final Doktor doktor;
  DoktoriDetalji({Key key, this.doktor}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalji doktora"),
        ),
        body:Card(
          color: Colors.grey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Doktor : '),
                    SizedBox(height: 10),
                    Text('Spol : '),
                    SizedBox(height: 10),
                    Text('Datum rodjenja : '),
                    SizedBox(height: 10),
                    Text('Jmbg : '),
                    SizedBox(height: 10),
                    Text('Grad : '),
                    SizedBox(height: 10),
                    Text('Email : '),
                    SizedBox(height: 10),
                    Text('Telefon : '),
                  ],
                ),
              ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(doktor.ime+' '+doktor.prezime),
                        SizedBox(height: 10),
                        Text(doktor.spol),
                        SizedBox(height: 10),
                        Text(doktor.datumRodjenja),
                        SizedBox(height: 10),
                        Text(doktor.jmbg),
                        SizedBox(height: 10),
                        Text(doktor.grad),
                        SizedBox(height: 10),
                        Text(doktor.email),
                        SizedBox(height: 10),
                        Text(doktor.telefon),
                      ],
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}