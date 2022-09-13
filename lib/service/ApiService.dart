import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String username;
  static String password;
  String route;

  ApiService({this.route});

  void SetParameter(String Username, String Password) {
    username = Username;
    password = Password;
  }

  static Future<List<dynamic>> Get(String route, dynamic object) async {
    String queryString = Uri(queryParameters: object).query;
    String baseurl = "http://172.26.160.1:5001/api" + route;

    if (object != null) {
      baseurl = baseurl + '?' + queryString;
    }
    final String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('$username:$password'));
    final response = await http.get(
        Uri.parse(baseurl),
        headers: {HttpHeaders.authorizationHeader: basicAuth}
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List;
      //print("OK");
      //return JsonDecoder().convert(response.body);
    }
    return null;
  }
// static Future<dynamic> GetById(String route, dynamic id) async{
//   String baseUrl="http://172.26.160.1:5001/api"+ route + "/" + id;
//   final String basicAuth='Basic '+base64Encode(utf8.encode('$username:$password'));
//   final response= await http.get(
//     Uri.parse(baseUrl),
//     headers: {HttpHeaders.authorizationHeader:basicAuth},
//   );
//   if(response.statusCode==200)
//     return json.decode(response.body);
//   return null;
// }

// static Future<dynamic> Post(String route, String body) async {
//   String baseUrl="http://172.26.160.1:5001/api"+route;
//   final response = await http.post(
//     Uri.parse(baseUrl),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: body,
//   );
//
//   if (response.statusCode == 201) {
//     ...
//   }
// }
}
