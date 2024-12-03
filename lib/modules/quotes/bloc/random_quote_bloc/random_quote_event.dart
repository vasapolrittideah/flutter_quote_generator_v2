part of 'random_quote_bloc.dart';

sealed class RandomQuoteEvent extends Equatable {
  const RandomQuoteEvent();
}

final class RandomQuoteRequested extends RandomQuoteEvent {
  const RandomQuoteRequested();

  @override
  List<Object?> get props => [];
}
