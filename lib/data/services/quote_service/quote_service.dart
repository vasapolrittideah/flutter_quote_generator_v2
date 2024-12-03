import 'package:fpdart/fpdart.dart';

import 'package:flutter_quote_generator_v2/core/errors/failure.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';

abstract class QuoteService {
  Future<Either<Failure, Quote>> fetchNewQuote();
  Future<List<Quote>> getFavoriteQuotes();
  Future<void> addFavoriteQuote(Quote quote);
  Future<void> removeFavoriteQuote(Quote quote);
}
