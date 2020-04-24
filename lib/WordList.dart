import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordList extends StatefulWidget {
  final String title;

  const WordList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  var word_list = const [];

  Future loadMessageList() async {
    var content = await rootBundle.loadString('data/words.json');
    var collection = json.decode(content);

    setState(() {
      word_list = collection;
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
        itemCount: word_list.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var vocabulary = word_list[index];

          return ListTile(
            title: Text(
              vocabulary['word']),
              isThreeLine: true,
            leading: CircleAvatar(
              child: Text(vocabulary['word'][0].toUpperCase()),
            ),
            subtitle: Text(
              vocabulary['defination'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}