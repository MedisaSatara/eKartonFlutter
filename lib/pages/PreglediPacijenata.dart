import 'dart:convert';
import 'package:ekartonflutter/models/Terapija.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekartonflutter/service/ApiService.dart';
import 'package:ekartonflutter/models/Pregledi.dart';
import 'package:ekartonflutter/pages/PreglediDetalji.dart';

class PreglediPacijenata extends StatefulWidget{
  @override
  _PreglediState createState() => _PreglediState();
}

class _PreglediState extends State<PreglediPacijenata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pregledi"),
        ),
        body:Column(
          children: [
            Center(child: bodyWidget())
            //Expanded(child: pageWidget())
          ],
        )
    );
  }


  Widget bodyWidget() {
    return FutureBuilder<List<Pregledi>>(
        future: GetPregledi(),
        builder: (BuildContext context, AsyncSnapshot<List<Pregledi>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."),);
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'),);
            } else {
              return ListView(
                children: snapshot.data.map((e) => PreglediWidget(e)).toList(),
              );
            }
          }
        }
    );
  }

  Future<List<Pregledi>> GetPregledi() async {
    var pregledi = await ApiService.Get('/Pregled',null);
    return pregledi.map((i) => Pregledi.fromJson(i)).toList();
  }

  Widget PreglediWidget(pregled) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PreglediDetalji(pregled: pregled,))
          );
        },

        child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text(pregled.datum,style: TextStyle(color: Colors.black),),)
              ],
            )
        ),
      ),
    );
  }
}