import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/text_button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/progress/circular_progress.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.quote,
    required this.isFavorite,
    required this.setIsFavorite,
    super.key,
  });

  final Quote quote;
  final bool isFavorite;
  final ValueChanged<bool> setIsFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteQuoteBloc, FavoriteQuoteState>(
      listener: (context, state) {
        if (state is FavoriteQuoteSuccess) {
          for (final quote in state.quotes) {
            if (quote.id == quote.id) {
              setIsFavorite(true);
              return;
            }
          }
          setIsFavorite(false);
        }
      },
      builder: (context, state) {
        return AppTextButton(
          buttonSize: AppButtonSize.sm,
          borderRadius: BorderRadius.circular(
            context.appTheme.tokens.borders.borderRadiusFull,
          ),
          label: state is FavoriteQuoteLoading
              ? const AppCircularProgress(
                  circularProgressSize: AppCircularProgressSize.xs,
                )
              : FaIcon(
                  isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isFavorite
                      ? context.appTheme.tokens.colors.primary
                      : context.appTheme.tokens.colors.onBackground,
                ),
          onTap: () => _onTap(context),
        );
      },
    );
  }

  void _onTap(BuildContext context) {
    context.read<FavoriteQuoteBloc>().add(
          !isFavorite ? FavoriteQuoteAdded(quote) : FavoriteQuoteRemoved(quote),
        );
    setIsFavorite(!isFavorite);
  }
}
