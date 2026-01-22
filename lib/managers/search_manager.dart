import 'package:flutter/material.dart';
import 'package:mvskoke_dictionary/managers/database_helper.dart';
import 'package:mvskoke_dictionary/models/search_result.dart';
import 'package:mvskoke_dictionary/services/service_locator.dart';

class SearchManager {
  final resultsNotifier = ValueNotifier<List<SearchResult>>([]);
  final dbHelper = getIt<DatabaseHelper>();
}
