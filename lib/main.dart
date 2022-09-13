import 'package:flutter/material.dart';

import 'package:ekartonflutter/pages/Pacijenti.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:ekartonflutter/pages/Loading.dart';
import 'package:ekartonflutter/pages/Login.dart';
import 'package:ekartonflutter/pages/Home.dart';
import 'package:ekartonflutter/pages/Pacijenti.dart';
import 'package:ekartonflutter/pages/Doktori.dart';
import 'package:ekartonflutter/pages/Termini.dart';
import 'package:ekartonflutter/pages/PreglediPacijenata.dart';
import 'package:ekartonflutter/pages/PreglediDetalji.dart';




void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eKarton"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/image.jpg")

                )
              ],
            )
        ),
      ),
    );
  }
}
*/
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "eKarton",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),

      home: Login(),

      routes: {
        '/loading':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/pacijenti':(context)=>Pacijenti(),
        '/doktori':(context)=>Doktori(),
        '/pregledi':(context)=>PreglediPacijenata(),
        '/termini':(context)=>Termini()


      },
    );
  }
}
