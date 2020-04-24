import 'package:flutter/material.dart';

import 'WordList.dart';

void main() => runApp(MyWords());

class MyWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.greenAccent),
      home:WordList(title:'my vocabulary'),
      
    );
  }
}

