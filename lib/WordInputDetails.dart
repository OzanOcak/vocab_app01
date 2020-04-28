import 'package:flutter/material.dart';

class WordInputDetails extends StatelessWidget {
  final String word;
  final String defination;

  WordInputDetails(this.word, this.defination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.word)),
        body: Container(padding: EdgeInsets.all(16), child: Text(this.defination)));
  }
}