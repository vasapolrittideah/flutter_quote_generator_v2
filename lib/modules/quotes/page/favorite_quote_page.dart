import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_quote_generator_v2/core/widgets/progress/circular_progress.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/widgets/quote_card_with_sequence.dart';

class FavoriteQuotePage extends StatelessWidget {
  const FavoriteQuotePage({super.key});

  static const String path = '/favorite_quote';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavoriteQuoteBloc, FavoriteQuoteState>(
          builder: (context, state) {
            if (state is FavoriteQuoteInitial ||
                state is FavoriteQuoteLoading) {
              return const Center(
                child: AppCircularProgress(
                  circularProgressSize: AppCircularProgressSize.sm,
                ),
              );
            }

            if (state is FavoriteQuoteSuccess) {
              return CarouselSlider(
                items: state.quotes.mapIndexed(
                  (index, quote) {
                    return QuoteCardWithSequence(
                      quote: quote,
                      index: index,
                      isLoading: state is FavoriteQuoteLoading,
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  height: MediaQuery.of(context).size.height,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0,
                  viewportFraction: 1,
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
