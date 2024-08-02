// lib/viewmodels/word_viewmodel.dart

import 'package:flutter/material.dart';
import '../models/word_model.dart';
import '../services/api_service.dart';


class WordViewModel extends ChangeNotifier {
  List<Word> _words = [];
  bool _isLoading = false;

  List<Word> get words => _words;
  bool get isLoading => _isLoading;

  Future<void> fetchWords(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _words = await ApiService.fetchWords(query);
    } catch (e) {
      print("Error fetching words: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
