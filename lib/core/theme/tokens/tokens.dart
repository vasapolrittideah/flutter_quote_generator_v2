import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/tokens/borders.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/colors.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/opacities.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/shadows.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/sizes.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/typography/typography.dart';

final class AppTokens extends ThemeExtension<AppTokens> {
  const AppTokens({
    required this.borders,
    required this.colors,
    required this.opacities,
    required this.shadows,
    required this.sizes,
    required this.typography,
  });

  static const light = AppTokens(
    borders: AppBorders.borders,
    colors: AppColors.light,
    opacities: AppOpacities.opacities,
    shadows: AppShadows.light,
    sizes: AppSizes.sizes,
    typography: AppTypography.typography,
  );

  final AppBorders borders;
  final AppColors colors;
  final AppOpacities opacities;
  final AppShadows shadows;
  final AppSizes sizes;
  final AppTypography typography;

  @override
  AppTokens copyWith({
    AppBorders? borders,
    AppColors? colors,
    AppOpacities? opacities,
    AppShadows? shadows,
    AppSizes? sizes,
    AppTypography? typography,
  }) {
    return AppTokens(
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      opacities: opacities ?? this.opacities,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
      typography: typography ?? this.typography,
    );
  }

  @override
  AppTokens lerp(ThemeExtension<AppTokens>? other, double t) {
    if (other is! AppTokens) {
      return this;
    }

    return AppTokens(
      borders: borders.lerp(other.borders, t),
      colors: colors.lerp(other.colors, t),
      opacities: opacities.lerp(other.opacities, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
      typography: typography.lerp(other.typography, t),
    );
  }
}
