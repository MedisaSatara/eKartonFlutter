import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:ekartonflutter/models/Pregledi.dart';
import 'package:flutter/material.dart';
import 'package:ekartonflutter/models/Pacijent.dart';
import 'package:ekartonflutter/models/Terapija.dart';
import 'package:ekartonflutter/pages/TerapijaDetalji.dart';


class PreglediDetalji extends StatelessWidget {
  final Pregledi pregled;
  final Pacijent pacijent;
  final Terapija terapije;


  PreglediDetalji({Key key, this.pregled, this.pacijent, this.terapije})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalji pregleda"),
        ),
        body:  Card(
          color: Colors.grey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Razlog posjete : '),
                      SizedBox(height: 10),
                      Text('Dijagnoza :'),
                      SizedBox(height: 10),
                      Text('Datum :'),
                      SizedBox(height: 10),
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
                        Text(pregled.razlogPosjete),
                        SizedBox(height: 10),
                        Text(pregled.dijagnoza),
                        SizedBox(height: 10),
                        Text(pregled.datum.toString()),
                        SizedBox(height: 10),


                      ],
                    )
                ),
              ),
            ],
          ),
        )
    );
  }


}