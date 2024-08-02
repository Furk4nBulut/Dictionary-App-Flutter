// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';

class ApiService {
  static const String _baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  static Future<List<Word>> fetchWords(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl$query"));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Word.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load words");
    }
  }
}
