import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/word_view_model.dart';

class SearchAndResultView extends StatefulWidget {
  @override
  _SearchAndResultViewState createState() => _SearchAndResultViewState();
}

class _SearchAndResultViewState extends State<SearchAndResultView> {
  final TextEditingController _controller = TextEditingController();

  void _performSearch() {
    final query = _controller.text;
    if (query.isNotEmpty) {
      print('Searching for: $query'); // Debugging amacıyla eklendi
      Provider.of<WordViewModel>(context, listen: false).fetchWords(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.amber),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2.0),
              ),
            ),
            cursorColor: Colors.amber,
            onSubmitted: (query) => _performSearch(), // Enter tuşuna basıldığında arama yapar
          ),
          SizedBox(height: 10), // Arama çubuğu ile sonuçlar arasında boşluk
          Expanded(
            child: Consumer<WordViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (viewModel.words.isEmpty) {
                  return Center(child: Text('No words found.'));
                }
                return ListView.builder(
                  itemCount: viewModel.words.length,
                  itemBuilder: (context, index) {
                    final word = viewModel.words[index];
                    return ListTile(
                      title: Text(word.word),
                      subtitle: Text(word.definition),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
