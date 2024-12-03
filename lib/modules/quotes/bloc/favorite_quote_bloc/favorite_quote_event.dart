part of 'favorite_quote_bloc.dart';

sealed class FavoriteQuoteEvent extends Equatable {
  const FavoriteQuoteEvent();
}

class FavoriteQuoteRequested extends FavoriteQuoteEvent {
  const FavoriteQuoteRequested();

  @override
  List<Object?> get props => [];
}

class FavoriteQuoteAdded extends FavoriteQuoteEvent {
  const FavoriteQuoteAdded(this.quote);

  final Quote quote;

  @override
  List<Object?> get props => [quote];
}

class FavoriteQuoteRemoved extends FavoriteQuoteEvent {
  const FavoriteQuoteRemoved(this.quote);

  final Quote quote;

  @override
  List<Object?> get props => [quote];
}
