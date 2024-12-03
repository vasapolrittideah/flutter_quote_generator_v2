import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/app.dart';
import 'package:flutter_quote_generator_v2/core/di/injectable.dart';
import 'package:flutter_quote_generator_v2/data/local/hive/hive_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<HiveManger>().init();

  runApp(const App());
}
