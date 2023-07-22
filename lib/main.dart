// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:bb_characters/approutes.dart';

void main() {
  runApp(CharactersApp(
    approutes: Approutes(),
  ));
}

class CharactersApp extends StatelessWidget {
  final Approutes approutes;
  const CharactersApp({
    Key? key,
    required this.approutes,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: approutes.generateroute,
    );
  }
}
