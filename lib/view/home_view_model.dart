import 'dart:convert';

import 'package:flutter/material.dart';
import '../core/model/en/word.dart';
import '../core/service/DictionaryService.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

class WordViewModel {
  Future<Word?> fetchWord(String word) async {
    final response = await http.get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en_US/$word'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Word.fromJson(data[0]);
    } else {
      throw Exception('Failed to load word');
    }
  }
}
