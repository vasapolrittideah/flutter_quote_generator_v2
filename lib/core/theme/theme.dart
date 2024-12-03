import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/button/button_theme.dart';
import 'package:flutter_quote_generator_v2/core/theme/progress/circular_progress/circular_progress_theme.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/borders.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/colors.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/opacities.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/shadows.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/sizes.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/typography/typography.dart';

final class AppTheme extends ThemeExtension<AppTheme> {
  AppTheme({required this.tokens})
      : circularProgressTheme = AppCircularProgressTheme(tokens: tokens),
        buttonTheme = AppButtonTheme(tokens: tokens);

  final AppTokens tokens;
  final AppButtonTheme buttonTheme;
  final AppCircularProgressTheme circularProgressTheme;

  @override
  AppTheme copyWith({AppTokens? tokens}) {
    return AppTheme(tokens: tokens ?? this.tokens);
  }

  @override
  AppTheme lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(tokens: tokens.lerp(other.tokens, t));
  }
}

extension AppThemeX on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  AppBorders get appBorders => appTheme.tokens.borders;
  AppColors get appColors => appTheme.tokens.colors;
  AppOpacities get appOpacities => appTheme.tokens.opacities;
  AppShadows get appShadows => appTheme.tokens.shadows;
  AppSizes get appSizes => appTheme.tokens.sizes;
  AppTypography get appTypography => appTheme.tokens.typography;
}
