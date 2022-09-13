import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekartonflutter/service/ApiService.dart';
import 'package:ekartonflutter/models/Termin.dart';
import 'package:ekartonflutter/pages/TerminiDetalji.dart';

class Termini extends StatefulWidget{
  @override
  _TerminiState createState() => _TerminiState();
}

class _TerminiState extends State<Termini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista zauzetih termina pregleda"),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return FutureBuilder<List<Termin>>(
        future: GetTermini(),
        builder: (BuildContext context, AsyncSnapshot<List<Termin>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."),);
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'),);
            } else {
              return ListView(
                children: snapshot.data.map((e) => TerminiWidget(e)).toList(),
              );
            }
          }
        }
    );
  }

  Future<List<Termin>> GetTermini() async {
    var termini = await ApiService.Get('/Termin',null);
    return termini.map((i) => Termin.fromJson(i)).toList();
  }

  Widget TerminiWidget(termin) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TerminiDetalji(termin: termin,))
          );
        },
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text(termin.vrijeme,style: TextStyle(color: Colors.black),),)
              ],
            )
        ),
      ),
    );
  }
}