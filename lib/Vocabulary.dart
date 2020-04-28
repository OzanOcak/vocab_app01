import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'Vocabulary.g.dart';

@JsonSerializable()
class Vocabulary {
  final String word;
  final String defination;

  Vocabulary(this.word, this.defination);

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>_$VocabularyFromJson(json);

  static Future<List<Vocabulary>> browse() async {
    http.Response response =
        await http.get('http://www.mocky.io/v2/5ea78ce22f00003f33c4ee35');

    await Future.delayed(Duration(seconds: 3));

    String content = response.body;
    List collection = json.decode(content);
    List<Vocabulary> _wordList =
        collection.map((json) => Vocabulary.fromJson(json)).toList();

    return _wordList;
  }

  }