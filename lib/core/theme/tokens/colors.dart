import 'package:flutter/material.dart';

final class AppColors extends ThemeExtension<AppColors> {

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.shadow,
    required this.outline,
  });
  static const light = AppColors(
    primary: Color(0xFFFC3C17),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE96848),
    onPrimaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFFFD8C00),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFB20E),
    onSecondaryContainer: Color(0xFFFFFFFF),
    tertiary: Color(0xFFFAD097),
    onTertiary: Color(0xFF000000),
    background: Color(0xFFF5F5F5),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    shadow: Color(0xFF000000),
    outline: Color(0xFFE7E7E7),
  );

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  // final Color tertiaryContainer;
  // final Color onTertiaryContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color shadow;
  final Color outline;

  @override
  AppColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? shadow,
    Color? outline,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.primaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.secondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      shadow: shadow ?? this.shadow,
      outline: outline ?? this.outline,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
    );
  }
}
