class Vocabulary {
  final String word;
  final String defination;

  Vocabulary(this.word, this.defination);

  Vocabulary.fromJson(Map<String, dynamic> json)
            : word = json['word'],defination = json['defination'];
}