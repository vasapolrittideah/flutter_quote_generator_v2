import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';

final class AppCircularProgressSizes
    extends ThemeExtension<AppCircularProgressSizes> {
  AppCircularProgressSizes({required this.tokens})
      : xs = AppCircularProgressSizeProperties(
          progressSizeValue: tokens.sizes.s16,
          progressStrokeWidth: tokens.sizes.s2,
        ),
        sm = AppCircularProgressSizeProperties(
          progressSizeValue: tokens.sizes.s24,
          progressStrokeWidth: tokens.sizes.s4,
        ),
        md = AppCircularProgressSizeProperties(
          progressSizeValue: tokens.sizes.s32,
          progressStrokeWidth: tokens.sizes.s4,
        ),
        lg = AppCircularProgressSizeProperties(
          progressSizeValue: tokens.sizes.s48,
          progressStrokeWidth: tokens.sizes.s4,
        );

  final AppTokens tokens;
  final AppCircularProgressSizeProperties xs;
  final AppCircularProgressSizeProperties sm;
  final AppCircularProgressSizeProperties md;
  final AppCircularProgressSizeProperties lg;

  @override
  AppCircularProgressSizes copyWith({
    AppTokens? tokens,
    AppCircularProgressSizeProperties? xs,
    AppCircularProgressSizeProperties? sm,
    AppCircularProgressSizeProperties? md,
    AppCircularProgressSizeProperties? lg,
  }) {
    return AppCircularProgressSizes(tokens: tokens ?? this.tokens);
  }

  @override
  AppCircularProgressSizes lerp(
    ThemeExtension<AppCircularProgressSizes>? other,
    double t,
  ) {
    if (other is! AppCircularProgressSizes) {
      return this;
    }

    return AppCircularProgressSizes(tokens: tokens);
  }
}
