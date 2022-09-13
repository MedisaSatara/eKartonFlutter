import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:ekartonflutter/models/Pacijent.dart';
import 'package:flutter/material.dart';

class PacijentiDetalji extends StatelessWidget{
  final Pacijent pacijent;
  PacijentiDetalji({Key key, this.pacijent}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalji pacijenta"),
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
                    Text('Pacijent : '),
                    SizedBox(height: 10),
                    Text('Broj kartona :'),
                    SizedBox(height: 10),
                    Text('Korisnicko ime : '),
                    SizedBox(height: 10),
                    Text('Spol : '),
                    SizedBox(height: 10),
                    Text('Datum rodjenja : '),
                    SizedBox(height: 10),
                    Text('Mjesto rodjenja : '),
                    SizedBox(height: 10),
                    Text('Jmbg : '),
                    SizedBox(height: 10),
                    Text('Prebivaliste : '),
                    SizedBox(height: 10),
                    Text('Alergican : '),
                    SizedBox(height: 10),
                    Text('Krvna grupa : '),
                    SizedBox(height: 10),
                    Text('RhFaktor : '),
                    SizedBox(height: 10),
                    Text('Hronicne bolesti : '),
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
                        Text(pacijent.ime+' '+pacijent.prezime),
                        SizedBox(height: 10),
                        Text(pacijent.brojKartona),
                        SizedBox(height: 10),
                        Text(pacijent.korisnickoIme),
                        SizedBox(height: 10),
                        Text(pacijent.spol),
                        SizedBox(height: 10),
                        Text(pacijent.datumRodjenja),
                        SizedBox(height: 10),
                        Text(pacijent.mjestoRodjenja),
                        SizedBox(height: 10),
                        Text(pacijent.jmbg),
                        SizedBox(height: 10),
                        Text(pacijent.prebivaliste),
                        SizedBox(height: 10),
                        Text(pacijent.alergican),
                        SizedBox(height: 10),
                        Text(pacijent.krvnaGrupa),
                        SizedBox(height: 10),
                        Text(pacijent.rhFaktor),
                        SizedBox(height: 10),
                        Text(pacijent.hronicneBolesti),
                        SizedBox(height: 10),
                        Text(pacijent.telefon),
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