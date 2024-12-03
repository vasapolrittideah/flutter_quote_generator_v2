import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/core/constants/app_constants.dart';
import 'package:flutter_quote_generator_v2/core/helpers/file_operation_helper.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';

@injectable
class HiveManger {
  HiveManger(
    this._hive, {
    @factoryParam FileOperationHelper? fileOperationHelper,
  }) : _fileOperationHelper = fileOperationHelper ?? FileOperationHelper();

  final HiveInterface _hive;
  late final FileOperationHelper _fileOperationHelper;
  String get _subDirectory => AppConstants.appName;

  Future<void> init() async {
    await _open();
    registerAdapters();
  }

  Future<void> clear() async {
    await _hive.deleteFromDisk();
    await _fileOperationHelper.removeSubDirectory(_subDirectory);
  }

  Future<void> _open() async {
    final subPath =
        await _fileOperationHelper.createSubDirectory(_subDirectory);
    await _hive.initFlutter(subPath);
  }

  void registerAdapters() {
    _hive.registerAdapter(QuoteAdapter());
  }
}
