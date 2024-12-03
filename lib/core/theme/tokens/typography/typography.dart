import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/tokens/typography/text_styles.dart';

final class AppTypography extends ThemeExtension<AppTypography> {

  const AppTypography({
    required this.body,
    required this.heading,
  });
  static const typography = AppTypography(
    body: AppTextStyles.body,
    heading: AppTextStyles.heading,
  );

  final AppTextStyles body;
  final AppTextStyles heading;

  @override
  AppTypography copyWith({AppTextStyles? body, AppTextStyles? heading}) {
    return AppTypography(
      body: body ?? this.body,
      heading: heading ?? this.heading,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      body: body.lerp(other.body, t),
      heading: heading.lerp(other.heading, t),
    );
  }
}
