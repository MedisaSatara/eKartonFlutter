import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the home page!'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("eKarton"),
              decoration: BoxDecoration(
                  color: Colors.lightGreen
              ),),
            ListTile(
              title: Text("Pacijenti"),
              onTap: (){
                Navigator.of(context).pushNamed("/pacijenti");
              },
            ),
            ListTile(
              title: Text("Doktori"),
              onTap: (){
                Navigator.of(context).pushNamed("/doktori");
              },
            ),
            ListTile(
              title: Text("Pregledi"),
              onTap: (){
                Navigator.of(context).pushNamed("/pregledi");
              },
            ),
            ListTile(
              title: Text("Termin"),
              onTap: (){
                Navigator.of(context).pushNamed("/termini");
              },
            ),
          ],

        ),
      ),
    );
  }
}