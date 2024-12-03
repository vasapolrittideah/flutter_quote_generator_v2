import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/widgets/progress/circular_progress.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/random_quote_bloc/random_quote_bloc.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/widgets/favorite_button.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/widgets/quote_card.dart';

class RandomQuotePage extends StatefulWidget {
  const RandomQuotePage({super.key});

  static const String path = '/random_quote';

  @override
  State<RandomQuotePage> createState() => _RandomQuotePageState();
}

class _RandomQuotePageState extends State<RandomQuotePage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    context.read<RandomQuoteBloc>().add(const RandomQuoteRequested());
    context.read<FavoriteQuoteBloc>().add(const FavoriteQuoteRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RandomQuoteBloc, RandomQuoteState>(
          builder: (context, state) {
            if (state is RandomQuoteInitial || state is RandomQuoteLoading) {
              return const Center(
                child: AppCircularProgress(
                  circularProgressSize: AppCircularProgressSize.sm,
                ),
              );
            }

            if (state is RandomQuoteSuccess) {
              final Quote quote = state.quote;

              return CardSwiper(
                padding: EdgeInsets.zero,
                threshold: 100,
                cardsCount: 1,
                numberOfCardsDisplayed: 1,
                allowedSwipeDirection: const AllowedSwipeDirection.all(),
                onSwipe: (previousIndex, currentIndex, direction) {
                  setState(() => isFavorite = false);

                  context
                      .read<RandomQuoteBloc>()
                      .add(const RandomQuoteRequested());

                  return true;
                },
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.appTheme.tokens.sizes.s40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuoteCard(quote: quote),
                        SizedBox(height: context.appTheme.tokens.sizes.s8),
                        FavoriteButton(
                          quote: quote,
                          isFavorite: isFavorite,
                          setIsFavorite: _setIsFavorite,
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _setIsFavorite(bool value) {
    setState(() => isFavorite = value);
  }
}
