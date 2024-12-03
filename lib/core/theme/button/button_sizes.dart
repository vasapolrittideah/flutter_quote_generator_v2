import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/button/button_size_properties.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';

final class AppButtonSizes extends ThemeExtension<AppButtonSizes> {
  AppButtonSizes({required this.tokens})
      : xs = AppButtonSizeProperties(
          borderRadius: BorderRadius.circular(tokens.borders.borderRadiusXs),
          gap: tokens.sizes.s4,
          height: tokens.sizes.s24,
          iconSizeValue: tokens.sizes.s16,
          padding: EdgeInsets.symmetric(horizontal: tokens.sizes.s8),
          textStyle: tokens.typography.heading.text12,
        ),
        sm = AppButtonSizeProperties(
          borderRadius: BorderRadius.circular(tokens.borders.borderRadiusSm),
          gap: tokens.sizes.s4,
          height: tokens.sizes.s32,
          iconSizeValue: tokens.sizes.s24,
          padding: EdgeInsets.symmetric(horizontal: tokens.sizes.s12),
          textStyle: tokens.typography.heading.textDefault,
        ),
        md = AppButtonSizeProperties(
          borderRadius: BorderRadius.circular(tokens.borders.borderRadiusSm),
          gap: tokens.sizes.s8,
          height: tokens.sizes.s40,
          iconSizeValue: tokens.sizes.s24,
          padding: EdgeInsets.symmetric(horizontal: tokens.sizes.s16),
          textStyle: tokens.typography.heading.textDefault,
        ),
        lg = AppButtonSizeProperties(
          borderRadius: BorderRadius.circular(tokens.borders.borderRadiusSm),
          gap: tokens.sizes.s12,
          height: tokens.sizes.s48,
          iconSizeValue: tokens.sizes.s24,
          padding: EdgeInsets.symmetric(horizontal: tokens.sizes.s16),
          textStyle: tokens.typography.heading.text16,
        );

  final AppTokens tokens;
  final AppButtonSizeProperties xs;
  final AppButtonSizeProperties sm;
  final AppButtonSizeProperties md;
  final AppButtonSizeProperties lg;

  @override
  ThemeExtension<AppButtonSizes> copyWith({
    AppTokens? tokens,
    AppButtonSizeProperties? xs,
    AppButtonSizeProperties? sm,
    AppButtonSizeProperties? md,
    AppButtonSizeProperties? lg,
  }) {
    return AppButtonSizes(tokens: tokens ?? this.tokens);
  }

  @override
  AppButtonSizes lerp(ThemeExtension<AppButtonSizes>? other, double t) {
    if (other is! AppButtonSizes) {
      return this;
    }
    return AppButtonSizes(tokens: tokens.lerp(other.tokens, t));
  }
}
