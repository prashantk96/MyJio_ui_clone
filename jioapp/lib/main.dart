import 'package:flutter/material.dart';
import 'package:jioapp/views/home_page.dart';

void main() {
  runApp(const JioApp());
}

class JioApp extends StatelessWidget {
  const JioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MY Jio',
        theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(255, 15, 60, 201),
            fontFamily: 'roboto'),
        home: const homepage());
  }
}
