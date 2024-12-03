import 'package:flutter/material.dart';

final class AppButtonColors extends ThemeExtension<AppButtonColors> {
  const AppButtonColors({
    required this.borderColor,
    required this.textColor,
    required this.filledVariantBackgroundColor,
    required this.filledVariantTextColor,
    required this.textVariantTextColor,
  });

  final Color borderColor;
  final Color textColor;
  final Color filledVariantBackgroundColor;
  final Color filledVariantTextColor;
  final Color textVariantTextColor;

  @override
  AppButtonColors copyWith({
    Color? borderColor,
    Color? textColor,
    Color? filledVariantBackgroundColor,
    Color? filledVariantTextColor,
    Color? textVariantTextColor,
  }) {
    return AppButtonColors(
      borderColor: borderColor ?? this.borderColor,
      textColor: textColor ?? this.textColor,
      filledVariantBackgroundColor:
          filledVariantBackgroundColor ?? this.filledVariantBackgroundColor,
      filledVariantTextColor:
          filledVariantTextColor ?? this.filledVariantTextColor,
      textVariantTextColor: textVariantTextColor ?? this.textVariantTextColor,
    );
  }

  @override
  AppButtonColors lerp(ThemeExtension<AppButtonColors>? other, double t) {
    if (other is! AppButtonColors) {
      return this;
    }
    return AppButtonColors(
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      filledVariantBackgroundColor: Color.lerp(
          filledVariantBackgroundColor, other.filledVariantBackgroundColor, t,)!,
      filledVariantTextColor:
          Color.lerp(filledVariantTextColor, other.filledVariantTextColor, t)!,
      textVariantTextColor:
          Color.lerp(textVariantTextColor, other.textVariantTextColor, t)!,
    );
  }
}
