import 'package:app/Vocabulary.dart';
import 'package:app/WordInputScreen.dart';
import 'package:flutter/material.dart';

class WordInputButton extends StatelessWidget {
 
  final List<Vocabulary> wordList;

  WordInputButton(this.wordList); 

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Vocabulary vocabulary = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WordInputScreen(),
          ),
        );
        if(vocabulary != null){
         wordList.add(vocabulary);
         Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("${vocabulary.word} has been added"),
            backgroundColor: Colors.green,
          ),);
        }
      },
    );
  }
}