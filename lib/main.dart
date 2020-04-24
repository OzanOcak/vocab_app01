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

  var words = const ['reign','telepathy','lottery','measurement','pasenger'];

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body:  ListView.separated(
        itemCount: words.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var word = words[index];

          return ListTile(
            title: Text(word),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text(word[0].toUpperCase()),
            ),
            subtitle: Text('there will be meaning of the word whatever it is '),
          );
        },
      ),
    );
  }
}