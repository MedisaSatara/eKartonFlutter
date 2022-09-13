import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:ekartonflutter/models/Termin.dart';
import 'package:flutter/material.dart';

class TerminiDetalji extends StatelessWidget{
  final Termin termin;
  TerminiDetalji({Key key, this.termin}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalji termina"),
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
                    Text('Datum : '),
                    SizedBox(height: 10),
                    Text('Vrijeme :'),
                    SizedBox(height: 10),
                    Text('Razlog : '),
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
                        Text(termin.datum.toString()),
                        SizedBox(height: 10),
                        Text(termin.vrijeme),
                        SizedBox(height: 10),
                        Text(termin.razlog)
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