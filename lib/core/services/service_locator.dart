import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  serviceLocator.registerLazySingleton<CacheHelper>(() => CacheHelper());
  serviceLocator.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
}
