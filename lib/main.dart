import 'package:flutter/material.dart';

void main() => runApp(MyWords());

class MyWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.greenAccent),
      home: MyHomePage(title: 'My Vocabulary'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(child:Text("hello world")),
    );
  }
}