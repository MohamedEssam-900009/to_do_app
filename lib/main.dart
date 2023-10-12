import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await serviceLocator<CacheHelper>().init();
  runApp(const MyApp());
}
