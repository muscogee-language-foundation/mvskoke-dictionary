import 'package:mvskoke_dictionary/database/term.dart';

class DatabaseHelper {
  Future<List<Term>> getAll() async {
    return [
      Term(id: 1, lexeme: 'Afvcketv', phonetics: ''),
      Term(id: 2, lexeme: 'Cvfekne', phonetics: ''),
      Term(id: 3, lexeme: 'Cvpake', phonetics: ''),
      Term(id: 4, lexeme: 'Ēkvsvmetv', phonetics: ''),
    ];
  }

  Future<Term?> getTerm(int termId) async {
    final allTerms = await getAll();
    return allTerms.firstWhere((term) => term.id == termId);
  }
}
