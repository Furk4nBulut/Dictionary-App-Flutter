import 'meaning.dart';

class Word {
  final String word;
  final List<Meaning> meanings;

  Word({required this.word, required this.meanings});

  factory Word.fromJson(Map<String, dynamic> json) {
    var meaningsFromJson = json['meanings'] as List;
    List<Meaning> meaningsList = meaningsFromJson.map((i) => Meaning.fromJson(i)).toList();

    return Word(
      word: json['word'],
      meanings: meaningsList,
    );
  }
}
