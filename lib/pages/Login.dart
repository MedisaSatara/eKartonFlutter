import 'package:ekartonflutter/service/ApiService.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  var result=null;
  Future<void> GetData() async {
    result=await ApiService.Get('/Pacijent',null);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("eKarton", style: TextStyle(fontSize: 30),),
              SizedBox(
                height: 20,
                width: 60,
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color:Colors.lightGreen),
                    ),
                    hintText: "Korisnicko ime"
                ),
              ),
              SizedBox(
                height: 20,
                width: 60,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color:Colors.lightGreen)),
                    focusColor: Colors.lightGreen,
                    hintText: "Lozinka"
                ),
              ),
              SizedBox(
                height: 20,
                width: 60,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.lightGreen[700],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () async{
                    ApiService.username=usernameController.text;
                    ApiService.password=passwordController.text;
                    await GetData();
                    if(result!=null)
                      Navigator.of(context).pushReplacementNamed('/home');
                  },

                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}