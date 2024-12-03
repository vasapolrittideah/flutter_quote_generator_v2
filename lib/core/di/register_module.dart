import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/data/local/hive/hive_operation.dart';
import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_database.dart';
import 'package:flutter_quote_generator_v2/data/local/secure/secure_storage_manager.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/data/remote/dio_factory.dart';

@module
abstract class RegisterModule {
  @singleton
  HiveInterface get hive => Hive;

  @lazySingleton
  Dio get dio => DioFactory.getInstance();

  @LazySingleton(as: PrimitiveDatabase)
  SecureStorageManager get secureStorageManager =>
      SecureStorageManager(const FlutterSecureStorage());

  @lazySingleton
  HiveOperation<Quote> get quoteHiveOperation =>
      HiveOperation<Quote>(hive, secureStorageManager);
}
