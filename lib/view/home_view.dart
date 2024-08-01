import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constant/application_constant.dart';
import '../core/model/en/word.dart';
import '../core/service/DictionaryService.dart';
import 'home_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchField(),
            SizedBox(height: 20),
            Expanded(child: _buildWordList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      onChanged: (text) {
        setState(() {
          _searchText = text;
        });
      },
      onSubmitted: (text) {
        _fetchWord();
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Enter a word',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }

  Widget _buildWordList() {
    return FutureBuilder<Word?>(
      future: context.read<WordViewModel>().fetchWord(_searchText),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No word found'));
        }

        final word = snapshot.data!;
        return ListView(
          children: [
            _buildWordCard(word),
          ],
        );
      },
    );
  }

  Widget _buildWordCard(Word word) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.word,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            ...word.meanings.map((meaning) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meaning.partOfSpeech,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  ...meaning.definitions.map((definition) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        '- ${definition.definition}\nExample: ${definition.example}',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void _fetchWord() {
    if (_searchText.isNotEmpty) {
      setState(() {
        context.read<WordViewModel>().fetchWord(_searchText);
      });
    }
  }
}
