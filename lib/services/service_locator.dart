import 'package:get_it/get_it.dart';
import 'package:mvskoke_dictionary/database/database_helper.dart';
import 'package:mvskoke_dictionary/managers/search_manager.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  getIt.registerLazySingleton<SearchManager>(() => SearchManager());
}
