import 'dart:convert';

import 'package:app/Vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordList extends StatefulWidget {
  final String title;

  const WordList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  var wordList = const [];

  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/words.json');
    List collection = json.decode(content);
    List<Vocabulary> _wordList = collection.map((json) => Vocabulary.fromJson(json)).toList();

    setState(() {
      wordList = _wordList;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: wordList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Vocabulary vocabulary = wordList[index];

          return ListTile(
            title: Text(
              vocabulary.word),
              isThreeLine: true,
            leading: CircleAvatar(
              child: Text(vocabulary.word[0].toUpperCase()),
            ),
            subtitle: Text(
              vocabulary.defination,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}