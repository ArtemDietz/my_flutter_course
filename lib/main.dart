import 'package:flutter/material.dart';
import 'loginPage.dart';


void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Приложение++",
      theme: ThemeData.dark(),
      home: loginPage(),
    );
  }
}
