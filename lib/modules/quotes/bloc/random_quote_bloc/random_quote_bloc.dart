import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/core/errors/failure.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/data/services/quote_service/quote_service.dart';

part 'random_quote_event.dart';
part 'random_quote_state.dart';

@injectable
class RandomQuoteBloc extends Bloc<RandomQuoteEvent, RandomQuoteState> {
  RandomQuoteBloc(this._quoteService) : super(const RandomQuoteInitial()) {
    on<RandomQuoteRequested>(
      (event, emit) => _onRandomQuoteRequested(event, emit),
      transformer: restartable(),
    );
  }

  final QuoteService _quoteService;

  Future<void> _onRandomQuoteRequested(
    RandomQuoteRequested event,
    Emitter<RandomQuoteState> emit,
  ) async {
    emit(const RandomQuoteLoading());

    final result = await _quoteService.fetchNewQuote();

    result.fold(
      (failure) => emit(RandomQuoteFailure(failure)),
      (quote) => emit(RandomQuoteSuccess(quote)),
    );
  }
}
