// lib/models/word_model.dart

// lib/models/word_model.dart

class Word {
  final String word;
  final String definition;

  Word({required this.word, required this.definition});

  // JSON'dan Word nesnesine dönüştürme
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      definition: (json['meanings'][0]['definitions'][0]['definition'] ?? ""),
    );
  }

  // Word nesnesini JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'definition': definition,
    };
  }
}
