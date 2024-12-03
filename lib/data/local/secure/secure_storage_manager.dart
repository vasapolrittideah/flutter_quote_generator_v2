import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_quote_generator_v2/core/extensions/string_extension.dart';
import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_database.dart';
import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_keys.dart';

class SecureStorageManager extends PrimitiveDatabase {
  SecureStorageManager(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  @override
  Future<T?> read<T>(PrimitiveKeys key) async {
    final response = await _secureStorage.read(key: key.name);
    if (response == null || response.isEmpty) {
      return null;
    }

    return response.tryParse<T>();
  }

  @override
  Future<bool> write<T>(PrimitiveKeys key, {required T data}) async {
    try {
      await _secureStorage.write(key: key.name, value: data.toString());

      return true;
    } catch (error) {
      return false;
    }
  }
}
