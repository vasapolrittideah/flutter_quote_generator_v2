import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/progress/circular_progress/circular_progress_colors.dart';
import 'package:flutter_quote_generator_v2/core/theme/progress/circular_progress/circular_progress_sizes.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';

final class AppCircularProgressTheme
    extends ThemeExtension<AppCircularProgressTheme> {

  AppCircularProgressTheme({required this.tokens})
      : colors = AppCircularProgressColors(
          color: tokens.colors.primary,
          backgroundColor: tokens.colors.background,
        ),
        sizes = AppCircularProgressSizes(tokens: tokens);
  final AppTokens tokens;
  final AppCircularProgressColors colors;
  final AppCircularProgressSizes sizes;

  @override
  AppCircularProgressTheme copyWith({
    AppTokens? tokens,
    AppCircularProgressColors? colors,
    AppCircularProgressSizes? sizes,
  }) {
    return AppCircularProgressTheme(tokens: tokens ?? this.tokens);
  }

  @override
  AppCircularProgressTheme lerp(
    ThemeExtension<AppCircularProgressTheme>? other,
    double t,
  ) {
    if (other is! AppCircularProgressTheme) {
      return this;
    }

    return AppCircularProgressTheme(tokens: tokens.lerp(other.tokens, t));
  }
}
