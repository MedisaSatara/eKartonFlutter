import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:ekartonflutter/models/Terapija.dart';
import 'package:flutter/material.dart';

class TerapijaDetalji extends StatelessWidget{
  final Terapija terapija;
  TerapijaDetalji({Key key, this.terapija}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalji terapije : "),
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
                    Text('Naziv lijekova : '),
                    SizedBox(height: 10),
                    Text('Uputa :'),
                    SizedBox(height: 10),
                    Text('Podsjetnik : ')
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
                        Text(terapija.nazivLijekova),
                        SizedBox(height: 10),
                        Text(terapija.uputa),
                        SizedBox(height: 10),
                        Text(terapija.podsjetnik),
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