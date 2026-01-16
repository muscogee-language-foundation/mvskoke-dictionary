import 'package:flutter/material.dart';
import 'package:mvskoke_dictionary/database/term.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.term});

  final Term term;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(term.lexeme)),
    );
  }
}
