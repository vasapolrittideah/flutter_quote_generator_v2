import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/data/services/quote_service/quote_service.dart';

part 'favorite_quote_event.dart';
part 'favorite_quote_state.dart';

@injectable
class FavoriteQuoteBloc extends Bloc<FavoriteQuoteEvent, FavoriteQuoteState> {
  FavoriteQuoteBloc(this._quoteService) : super(const FavoriteQuoteInitial()) {
    on<FavoriteQuoteRequested>(
      (event, emit) => _favoriteQuoteRequested(event, emit),
    );

    on<FavoriteQuoteAdded>(
      (event, emit) => _favoriteQuoteAdded(event, emit),
    );

    on<FavoriteQuoteRemoved>(
      (event, emit) => _favoriteQuoteRemoved(event, emit),
    );
  }

  final QuoteService _quoteService;

  Future<void> _favoriteQuoteRequested(
    FavoriteQuoteRequested event,
    Emitter<FavoriteQuoteState> emit,
  ) async {
    emit(const FavoriteQuoteLoading());

    final quotes = await _quoteService.getFavoriteQuotes();

    emit(FavoriteQuoteSuccess(quotes));
  }

  Future<void> _favoriteQuoteAdded(
    FavoriteQuoteAdded event,
    Emitter<FavoriteQuoteState> emit,
  ) async {
    emit(const FavoriteQuoteLoading());

    await _quoteService.addFavoriteQuote(event.quote);

    add(const FavoriteQuoteRequested());
  }

  Future<void> _favoriteQuoteRemoved(
    FavoriteQuoteRemoved event,
    Emitter<FavoriteQuoteState> emit,
  ) async {
    emit(const FavoriteQuoteLoading());

    await _quoteService.removeFavoriteQuote(event.quote);

    add(const FavoriteQuoteRequested());
  }
}
