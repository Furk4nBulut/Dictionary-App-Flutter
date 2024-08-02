// lib/views/home/home_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/bar/custom_app_bar.dart';
import '../../viewmodels/word_view_model.dart';
import '../search/search_and_result_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Dictionary'),
      body: SearchAndResultView(),
    );
  }
}

