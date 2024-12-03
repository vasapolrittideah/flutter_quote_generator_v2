import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/text_button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/progress/circular_progress.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/widgets/quote_card.dart';

class QuoteCardWithSequence extends StatelessWidget {
  const QuoteCardWithSequence({
    required this.quote,
    required this.index,
    this.isLoading = false,
    super.key,
  });

  final Quote quote;
  final int index;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appTheme.tokens.sizes.s40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${index + 1}.',
            textAlign: TextAlign.center,
            style: context.appTheme.tokens.typography.heading.text20.copyWith(
              color: context.appTheme.tokens.colors.primary,
            ),
          ),
          SizedBox(height: context.appTheme.tokens.sizes.s8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.appTheme.tokens.sizes.s16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.appTheme.tokens.borders.borderRadiusFull,
              ),
              border: Border.all(
                color: context.appTheme.tokens.colors.outline,
                width: context.appTheme.tokens.borders.defaultBorderWidth,
              ),
              color: context.appTheme.tokens.colors.surface,
            ),
            child: Text(
              '#${quote.id}',
              textAlign: TextAlign.center,
              style: context.appTheme.tokens.typography.heading.text16,
            ),
          ),
          SizedBox(height: context.appTheme.tokens.sizes.s8),
          QuoteCard(quote: quote),
          SizedBox(height: context.appTheme.tokens.sizes.s12),
          AppTextButton(
            buttonSize: AppButtonSize.sm,
            borderRadius: BorderRadius.circular(
              context.appTheme.tokens.borders.borderRadiusFull,
            ),
            label: isLoading
                ? const AppCircularProgress(
                    circularProgressSize: AppCircularProgressSize.xs,
                  )
                : FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: context.appTheme.tokens.colors.onBackground,
                  ),
            onTap: () {
              context.read<FavoriteQuoteBloc>().add(
                    FavoriteQuoteRemoved(quote),
                  );
            },
          ),
        ],
      ),
    );
  }
}
