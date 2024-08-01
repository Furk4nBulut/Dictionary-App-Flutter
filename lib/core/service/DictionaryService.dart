import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/en/word.dart';

class DictionaryService {
  final String baseUrl;

  DictionaryService(this.baseUrl);

  Future<Word?> fetchWordData(String language, String word) async {
    final url = '$baseUrl$language/$word';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Word.fromJson(json);
    } else {
      throw Exception('Failed to load word data');
    }
  }
}
