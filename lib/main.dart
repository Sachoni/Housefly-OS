import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(TechlinkApp());
}

class TechlinkApp extends StatelessWidget {
  const TechlinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Techlink',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
