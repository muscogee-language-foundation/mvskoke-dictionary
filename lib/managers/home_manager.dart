import 'package:flutter/foundation.dart';
import 'package:mvskoke_dictionary/managers/database_helper.dart';
import 'package:mvskoke_dictionary/models/term.dart';
import 'package:mvskoke_dictionary/models/search_result.dart';
import 'package:mvskoke_dictionary/services/service_locator.dart';

class HomeManager {
  final termsNotifier = ValueNotifier<List<SearchResult>>([]);
  final _dbHelper = getIt<DatabaseHelper>();

  Future<void> init() async {
    // await getTermsForLetter(alphabet.first);
    await _dbHelper.getAll().then((terms) {
      final searchResults = terms
          .map((term) => SearchResult(termId: term.id, lexeme: term.word))
          .toList();
      termsNotifier.value = searchResults;
    });
  }

  Future<void> addToSearchHistory(int termId) async {
    // await _dbHelper.insertSearchHistory(termId);
  }

  Future<Term?> getTerm(String termId) async {
    return await _dbHelper.getTerm(termId);
  }
}
