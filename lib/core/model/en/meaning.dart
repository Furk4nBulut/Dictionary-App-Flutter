
import 'definition.dart';

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    var definitionsFromJson = json['definitions'] as List;
    List<Definition> definitionsList = definitionsFromJson.map((i) => Definition.fromJson(i)).toList();

    return Meaning(
      partOfSpeech: json['partOfSpeech'],
      definitions: definitionsList,
    );
  }
}
