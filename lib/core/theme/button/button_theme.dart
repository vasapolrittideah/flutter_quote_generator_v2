import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/button/button_colors.dart';
import 'package:flutter_quote_generator_v2/core/theme/button/button_sizes.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  AppButtonTheme({required this.tokens})
      : colors = AppButtonColors(
          borderColor: tokens.colors.outline,
          textColor: tokens.colors.onBackground,
          filledVariantBackgroundColor: tokens.colors.primary,
          filledVariantTextColor: tokens.colors.onPrimary,
          textVariantTextColor: tokens.colors.onBackground,
        ),
        sizes = AppButtonSizes(tokens: tokens);

  final AppTokens tokens;
  final AppButtonColors colors;
  final AppButtonSizes sizes;

  @override
  AppButtonTheme copyWith({AppTokens? tokens}) {
    return AppButtonTheme(tokens: tokens ?? this.tokens);
  }

  @override
  AppButtonTheme lerp(
    ThemeExtension<AppButtonTheme>? other,
    double t,
  ) {
    if (other is! AppButtonTheme) {
      return this;
    }
    return AppButtonTheme(tokens: tokens.lerp(other.tokens, t));
  }
}
