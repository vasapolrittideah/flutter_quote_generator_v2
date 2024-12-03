import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/generated/fonts.gen.dart';

final class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.textDefault,
    required this.text12,
    required this.text14,
    required this.text16,
    required this.text18,
    required this.text20,
    required this.text24,
  });

  static const _semiBold = FontWeight.w600;
  static const _fontFamily = FontFamily.ibmPlexSansThai;
  static const _semiBoldVariant = [FontVariation('wght', 600)];

  static const body = AppTextStyles(
    textDefault: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
    ),
    text12: TextStyle(
      fontSize: 12,
      fontFamily: _fontFamily,
    ),
    text14: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
    ),
    text16: TextStyle(
      fontSize: 16,
      fontFamily: _fontFamily,
    ),
    text18: TextStyle(
      fontSize: 18,
      fontFamily: _fontFamily,
    ),
    text20: TextStyle(
      fontSize: 20,
      fontFamily: _fontFamily,
    ),
    text24: TextStyle(
      fontSize: 24,
      fontFamily: _fontFamily,
    ),
  );

  static const heading = AppTextStyles(
    textDefault: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text12: TextStyle(
      fontSize: 12,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text14: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text16: TextStyle(
      fontSize: 16,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text18: TextStyle(
      fontSize: 18,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text20: TextStyle(
      fontSize: 20,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
    text24: TextStyle(
      fontSize: 24,
      fontFamily: _fontFamily,
      fontVariations: _semiBoldVariant,
      fontWeight: _semiBold,
    ),
  );

  final TextStyle textDefault;
  final TextStyle text12;
  final TextStyle text14;
  final TextStyle text16;
  final TextStyle text18;
  final TextStyle text20;
  final TextStyle text24;

  @override
  AppTextStyles copyWith({
    TextStyle? textDefault,
    TextStyle? text12,
    TextStyle? text14,
    TextStyle? text16,
    TextStyle? text18,
    TextStyle? text20,
    TextStyle? text24,
  }) {
    return AppTextStyles(
      textDefault: textDefault ?? this.textDefault,
      text12: text12 ?? this.text12,
      text14: text14 ?? this.text14,
      text16: text16 ?? this.text16,
      text18: text18 ?? this.text18,
      text20: text20 ?? this.text20,
      text24: text24 ?? this.text24,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }

    return AppTextStyles(
      textDefault: TextStyle.lerp(textDefault, other.textDefault, t)!,
      text12: TextStyle.lerp(text12, other.text12, t)!,
      text14: TextStyle.lerp(text14, other.text14, t)!,
      text16: TextStyle.lerp(text16, other.text16, t)!,
      text18: TextStyle.lerp(text18, other.text18, t)!,
      text20: TextStyle.lerp(text20, other.text20, t)!,
      text24: TextStyle.lerp(text24, other.text24, t)!,
    );
  }
}
