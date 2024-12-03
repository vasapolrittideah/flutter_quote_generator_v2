// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_quote_generator_v2/core/di/register_module.dart'
    as _i77;
import 'package:flutter_quote_generator_v2/core/helpers/file_operation_helper.dart'
    as _i338;
import 'package:flutter_quote_generator_v2/data/local/hive/hive_encryption.dart'
    as _i1029;
import 'package:flutter_quote_generator_v2/data/local/hive/hive_manager.dart'
    as _i54;
import 'package:flutter_quote_generator_v2/data/local/hive/hive_operation.dart'
    as _i291;
import 'package:flutter_quote_generator_v2/data/local/primitive/primitive_database.dart'
    as _i952;
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart'
    as _i519;
import 'package:flutter_quote_generator_v2/data/remote/network_client.dart'
    as _i278;
import 'package:flutter_quote_generator_v2/data/services/quote_service/quote_service.dart'
    as _i307;
import 'package:flutter_quote_generator_v2/data/services/quote_service/quote_service_impl.dart'
    as _i804;
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart'
    as _i117;
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/random_quote_bloc/random_quote_bloc.dart'
    as _i482;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/adapters.dart' as _i744;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i744.HiveInterface>(() => registerModule.hive);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i291.HiveOperation<_i519.Quote>>(
        () => registerModule.quoteHiveOperation);
    gh.factoryParam<_i54.HiveManger, _i338.FileOperationHelper?, dynamic>((
      fileOperationHelper,
      _,
    ) =>
        _i54.HiveManger(
          gh<_i744.HiveInterface>(),
          fileOperationHelper: fileOperationHelper,
        ));
    gh.lazySingleton<_i952.PrimitiveDatabase>(
        () => registerModule.secureStorageManager);
    gh.factoryParam<_i291.HiveOperation<dynamic>, _i1029.HiveEncryption?,
        dynamic>((
      hiveEncryption,
      _,
    ) =>
        _i291.HiveOperation<dynamic>(
          gh<_i744.HiveInterface>(),
          gh<_i952.PrimitiveDatabase>(),
          hiveEncryption: hiveEncryption,
        ));
    gh.lazySingleton<_i278.NetworkClient>(
        () => _i278.NetworkClient(gh<_i361.Dio>()));
    gh.factory<_i307.QuoteService>(() => _i804.QuoteServiceImpl(
          gh<_i278.NetworkClient>(),
          gh<_i291.HiveOperation<_i519.Quote>>(),
        ));
    gh.lazySingleton<_i1029.HiveEncryption>(() => _i1029.HiveEncryption(
          gh<_i744.HiveInterface>(),
          gh<_i952.PrimitiveDatabase>(),
        ));
    gh.factory<_i117.FavoriteQuoteBloc>(
        () => _i117.FavoriteQuoteBloc(gh<_i307.QuoteService>()));
    gh.factory<_i482.RandomQuoteBloc>(
        () => _i482.RandomQuoteBloc(gh<_i307.QuoteService>()));
    return this;
  }
}

class _$RegisterModule extends _i77.RegisterModule {}
