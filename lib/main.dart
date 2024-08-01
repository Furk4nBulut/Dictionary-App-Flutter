import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home_view.dart';
import 'view/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => WordViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
