import 'package:json_annotation/json_annotation.dart';

part 'Vocabulary.g.dart';

@JsonSerializable()
class Vocabulary {
  final String word;
  final String defination;

  Vocabulary(this.word, this.defination);

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>_$VocabularyFromJson(json);
}