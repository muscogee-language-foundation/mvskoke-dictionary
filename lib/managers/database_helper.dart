import 'package:mvskoke_dictionary/models/term.dart';
import 'package:mvskoke_dictionary/services/database_service.dart';
import 'package:mvskoke_dictionary/services/service_locator.dart';

class DatabaseHelper {
  DatabaseService get databaseService => getIt<DatabaseService>();

  Future<List<Term>> getAll() async {
    return await databaseService.loadDatabase();
  }

  Future<Term?> getTerm(String termId) async {
    final allTerms = await getAll();
    return allTerms.firstWhere((term) => term.id == termId);
  }
}
