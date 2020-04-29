//import 'dart:convert';
import 'dart:async';

import 'package:app/Vocabulary.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;

import 'WordInputButton.dart';
import 'WordInputDetails.dart';

class WordList extends StatefulWidget {
  final String title;

  const WordList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WordListState();
}

class _WordListState extends State<WordList> {

  Future<List<Vocabulary>> future;
  List<Vocabulary> wordList;

  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Vocabulary.browse();
    wordList = await future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  var _wordList = await Vocabulary.browse();

                  setState(() {
                    wordList = _wordList;
                  });
                })
          ],
        ),

        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("There was an error: ${snapshot.error}");
                var wordList = snapshot.data;

                return ListView.separated(
                  itemCount: wordList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Vocabulary vocabulary = wordList[index];

                     return ListTile(
                       title: Text(vocabulary.word),
                       isThreeLine: true,
                       leading: CircleAvatar(child: Text(vocabulary.word[0].toUpperCase()),),
                       subtitle: Text(
                           vocabulary.defination,
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              WordInputDetails(vocabulary.word, vocabulary.defination),
                        ),
                      );
                    },
                    );
                    
                  },
                );

            }
          },
        ),
        floatingActionButton: WordInputButton(wordList),
    );

  }
}