import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekartonflutter/service/ApiService.dart';
import 'package:ekartonflutter/models/Pacijent.dart';
import 'package:ekartonflutter/pages/PacijentiDetalji.dart';

class Pacijenti extends StatefulWidget{
  @override
  _PacijentiState createState() => _PacijentiState();
}

class _PacijentiState extends State<Pacijenti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista pacijenata "),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return FutureBuilder<List<Pacijent>>(
        future: GetPacijenti(),
        builder: (BuildContext context, AsyncSnapshot<List<Pacijent>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."),);
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'),);
            } else {
              return ListView(
                children: snapshot.data.map((e) => PacijentiWidget(e)).toList(),
              );
            }
          }
        }
    );
  }

  Future<List<Pacijent>> GetPacijenti() async {
    var pacijenti = await ApiService.Get('/Pacijent',null);
    return pacijenti.map((i) => Pacijent.fromJson(i)).toList();
  }

  Widget PacijentiWidget(pacijent) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PacijentiDetalji(pacijent: pacijent,))
          );
        },
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text(pacijent.ime+' '+pacijent.prezime,style: TextStyle(color: Colors.black),),)
              ],
            )
        ),
      ),
    );
  }
}
