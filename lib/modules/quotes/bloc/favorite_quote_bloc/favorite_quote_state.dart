part of 'favorite_quote_bloc.dart';

sealed class FavoriteQuoteState extends Equatable {
  const FavoriteQuoteState();
}

final class FavoriteQuoteInitial extends FavoriteQuoteState {
  const FavoriteQuoteInitial();

  @override
  List<Object> get props => [];
}

final class FavoriteQuoteLoading extends FavoriteQuoteState {
  const FavoriteQuoteLoading();

  @override
  List<Object> get props => [];
}

final class FavoriteQuoteSuccess extends FavoriteQuoteState {
  const FavoriteQuoteSuccess(this.quotes);

  final List<Quote> quotes;

  @override
  List<Object> get props => [quotes];
}
