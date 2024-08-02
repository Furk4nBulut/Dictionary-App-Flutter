// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';
import 'viewmodels/word_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WordViewModel()),
      ],
      child: MaterialApp(
        title: 'Dictionary App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.amber,
            textTheme: ButtonTextTheme.primary,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.amber,
          ),
        ),
        home: HomeView(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
