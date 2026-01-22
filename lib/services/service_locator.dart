import 'package:get_it/get_it.dart';
import 'package:mvskoke_dictionary/managers/database_helper.dart';
import 'package:mvskoke_dictionary/managers/search_manager.dart';
import 'package:mvskoke_dictionary/services/database_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  getIt.registerLazySingleton<SearchManager>(() => SearchManager());
}
