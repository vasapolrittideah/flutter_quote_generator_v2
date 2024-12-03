import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_database.dart';
import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_keys.dart';

@lazySingleton
class HiveEncryption {
  HiveEncryption(this._hive, this._primitiveDatabase);

  final HiveInterface _hive;
  final PrimitiveDatabase _primitiveDatabase;

  @visibleForTesting
  Uint8List? encryptionKey;

  Future<Uint8List> getSecureKey() async {
    if (this.encryptionKey != null) {
      return this.encryptionKey!;
    }

    var encryptionKeyString = await _primitiveDatabase.read<String>(
      PrimitiveKeys.secureStorageKey,
    );
    if (encryptionKeyString == null) {
      final key = _hive.generateSecureKey();
      await _primitiveDatabase.write<String>(
        PrimitiveKeys.secureStorageKey,
        data: base64UrlEncode(key),
      );

      encryptionKeyString = await _primitiveDatabase.read<String>(
        PrimitiveKeys.secureStorageKey,
      );
      if (encryptionKeyString == null) {
        throw Exception('Key is null');
      }
    }

    final encryptionKey = base64Url.decode(encryptionKeyString);
    this.encryptionKey = encryptionKey;
    return encryptionKey;
  }
}
