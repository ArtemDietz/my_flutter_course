import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _string = "";
  _changeLogin(String text){
    setState(() {
      _string = text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.search),
          Text("Login"),
        ],),
        backgroundColor: Colors.blue,
      ),
      body: Center(child:
      Column(
        children: [
          Text(_string),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.mail_rounded),
              hintText: "Логин",
              border: OutlineInputBorder()
            ),
            onChanged: _changeLogin,
          )
      ],),)
    );
  }
}
