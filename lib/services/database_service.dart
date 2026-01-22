import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mvskoke_dictionary/models/term.dart';

class DatabaseService {
  Future<List<Term>> loadDatabase() async {
    final jsonString = await rootBundle.loadString(
      'assets/dictionary_data.json',
    );
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return await parseDictionaryData(jsonResponse);
  }

  Future<List<Term>> parseDictionaryData(Map<String, dynamic> jsonData) async {
    final List<dynamic> termsJson = jsonData['data'];
    return termsJson.map((termJson) => Term.fromJson(termJson)).toList();
  }
}
