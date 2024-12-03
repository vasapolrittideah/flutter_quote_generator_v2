part of 'random_quote_bloc.dart';

sealed class RandomQuoteState extends Equatable {
  const RandomQuoteState();
}

final class RandomQuoteInitial extends RandomQuoteState {
  const RandomQuoteInitial();

  @override
  List<Object> get props => [];
}

final class RandomQuoteLoading extends RandomQuoteState {
  const RandomQuoteLoading();

  @override
  List<Object> get props => [];
}

final class RandomQuoteSuccess extends RandomQuoteState {
  const RandomQuoteSuccess(this.quote);

  final Quote quote;

  @override
  List<Object> get props => [quote];
}

final class RandomQuoteFailure extends RandomQuoteState {
  const RandomQuoteFailure(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [failure];
}
