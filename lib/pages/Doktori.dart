import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekartonflutter/service/ApiService.dart';
import 'package:ekartonflutter/models/Doktor.dart';
import 'package:ekartonflutter/pages/DoktoriDetalji.dart';
import 'package:ekartonflutter/models/Odjeli.dart';

class Doktori extends StatefulWidget{
  @override
  _DoktoriState createState() => _DoktoriState();
}

class _DoktoriState extends State<Doktori> {
  Odjeli _selectedOdjelNaziv = null;
  List<DropdownMenuItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista doktora"),
        ),
        body:Column(
          children: [
            Center(child: dropDownWidget()),
            Expanded(child: bodyWidget())
          ],
        )
    );
  }

  Widget dropDownWidget(){
    return FutureBuilder<List<Odjeli>>(
        future: GetOdjelNames(_selectedOdjelNaziv),
        builder: (BuildContext context,
            AsyncSnapshot<List<Odjeli>>snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text('Loading...'),
            );
          }
          else{
            if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            else{
              return Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: DropdownButton(
                  hint: Text('Odaberite naziv odjela'),
                  isExpanded: true,
                  items: items,
                  onChanged: (newVal){
                    setState(() {
                      _selectedOdjelNaziv=newVal;
                      GetDoktori(_selectedOdjelNaziv);
                    });
                  },
                  value: _selectedOdjelNaziv,
                ),
              );
            }
          }
        }
    );
  }

  Future<List<Odjeli>>GetOdjelNames(Odjeli selectedItem) async{
    var nazivodjela=await ApiService.Get('/Odjel',null);
    var nazivOdjelaList=nazivodjela.map((i) => Odjeli.fromJson(i)).toList();

    items = nazivOdjelaList.map((item){
      return DropdownMenuItem<Odjeli>(
        child: Text(item.naziv),
        value: item,
      );
    }).toList();

    if (selectedItem != null && selectedItem.odjelId != 0)
      _selectedOdjelNaziv = nazivOdjelaList.where((element) => element.odjelId == selectedItem.odjelId).first;
    return nazivOdjelaList;


  }


  Widget bodyWidget() {
    return FutureBuilder<List<Doktor>>(
        future: GetDoktori(_selectedOdjelNaziv),
        builder: (BuildContext context, AsyncSnapshot<List<Doktor>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."),);
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'),);
            } else {
              return ListView(
                children: snapshot.data.map((e) => DoktoriWidget(e)).toList(),
              );
            }
          }
        }
    );
  }

  Future<List<Doktor>> GetDoktori(Odjeli selectedItem) async {
    Map<String,String>queryParams = null;
    if(selectedItem !=null && selectedItem.odjelId!=0)
      queryParams={'OdjelId': selectedItem.odjelId.toString()};

    var doktori = await ApiService.Get('/Doktor',queryParams);
    return doktori.map((i) => Doktor.fromJson(i)).toList();
  }

  Widget DoktoriWidget(doktor) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DoktoriDetalji(doktor: doktor,))
          );
        },
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text(doktor.ime+' '+doktor.prezime,style: TextStyle(color: Colors.black),),)
              ],
            )
        ),
      ),
    );
  }
}