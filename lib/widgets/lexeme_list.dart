import 'package:flutter/material.dart';
import 'package:mvskoke_dictionary/models/search_result.dart';
import 'package:mvskoke_dictionary/utils/dimens.dart';

class LexemeList extends StatelessWidget {
  const LexemeList({super.key, required this.results, required this.onItemTap});

  final List<SearchResult> results;
  final void Function(String termId) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final term = results[index];
        return InkWell(
          onTap: () => onItemTap(term.termId),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.marginShort),
            child: Container(
              margin: EdgeInsets.all(1.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(term.lexeme),
              ),
            ),
          ),
        );
      },
    );
  }
}
