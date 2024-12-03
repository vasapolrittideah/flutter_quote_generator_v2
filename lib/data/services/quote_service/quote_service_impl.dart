import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/core/constants/api_endpoints.dart';
import 'package:flutter_quote_generator_v2/core/errors/error_handler.dart';
import 'package:flutter_quote_generator_v2/core/errors/failure.dart';
import 'package:flutter_quote_generator_v2/data/local/hive/hive_operation.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/data/remote/network_client.dart';
import 'package:flutter_quote_generator_v2/data/services/quote_service/quote_service.dart';

@Injectable(as: QuoteService)
class QuoteServiceImpl implements QuoteService {
  QuoteServiceImpl(this._networkClient, this._hiveOperation);

  final NetworkClient _networkClient;
  final HiveOperation<Quote> _hiveOperation;

  @override
  Future<Either<Failure, Quote>> fetchNewQuote() async {
    try {
      final response = await _networkClient.get(
        '${ApiEndpoints.quoteBaseUrl}/random',
      );

      return Right(Quote.fromJson(response.data));
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<List<Quote>> getFavoriteQuotes() async {
    return await _hiveOperation.getAllItems();
  }

  @override
  Future<void> addFavoriteQuote(Quote quote) async {
    await _hiveOperation.insertOrUpdateItem(quote.id.toString(), quote);
  }

  @override
  Future<void> removeFavoriteQuote(Quote quote) async {
    await _hiveOperation.deleteItem(quote.id.toString());
  }
}
