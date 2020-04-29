import 'package:app/Vocabulary.dart';
import 'package:flutter/material.dart';

class WordInputScreen extends StatefulWidget {
  @override
  _WordInputScreenState createState() => _WordInputScreenState();
}

class _WordInputScreenState extends State<WordInputScreen> {

  String to = "";
  String word = "";
  String defination = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extend your vocabulary! "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  to = value;
                },
                decoration: InputDecoration(
                  labelText: 'TO',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  word = value;
                },
                decoration: InputDecoration(
                  labelText: 'Word',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  defination = value;
                },
                decoration: InputDecoration(
                  labelText: 'Defination',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                maxLines: 9,
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  Vocabulary vocabulary = Vocabulary(word, defination);

                  Navigator.pop(context, vocabulary);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
