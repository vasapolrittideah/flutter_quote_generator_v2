import 'dart:ui';

import 'package:flutter/material.dart';

final class AppSizes extends ThemeExtension<AppSizes> {
  const AppSizes({
    required this.s2,
    required this.s4,
    required this.s8,
    required this.s12,
    required this.s16,
    required this.s24,
    required this.s32,
    required this.s40,
    required this.s48,
    required this.s56,
    required this.s64,
  });

  static const sizes = AppSizes(
    s2: 2,
    s4: 4,
    s8: 8,
    s12: 12,
    s16: 16,
    s24: 24,
    s32: 32,
    s40: 40,
    s48: 48,
    s56: 56,
    s64: 64,
  );

  final double s2;
  final double s4;
  final double s8;
  final double s12;
  final double s16;
  final double s24;
  final double s32;
  final double s40;
  final double s48;
  final double s56;
  final double s64;

  @override
  AppSizes copyWith({
    double? s2,
    double? s4,
    double? s8,
    double? s12,
    double? s16,
    double? s24,
    double? s32,
    double? s40,
    double? s48,
    double? s56,
    double? s64,
  }) {
    return AppSizes(
      s2: s2 ?? this.s2,
      s4: s4 ?? this.s4,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s24: s24 ?? this.s24,
      s32: s32 ?? this.s32,
      s40: s40 ?? this.s40,
      s48: s48 ?? this.s48,
      s56: s56 ?? this.s56,
      s64: s64 ?? this.s64,
    );
  }

  @override
  AppSizes lerp(ThemeExtension<AppSizes>? other, double t) {
    if (other is! AppSizes) {
      return this;
    }

    return AppSizes(
      s2: lerpDouble(s2, other.s2, t)!,
      s4: lerpDouble(s4, other.s4, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s16: lerpDouble(s16, other.s16, t)!,
      s24: lerpDouble(s24, other.s24, t)!,
      s32: lerpDouble(s32, other.s32, t)!,
      s40: lerpDouble(s40, other.s40, t)!,
      s48: lerpDouble(s48, other.s48, t)!,
      s56: lerpDouble(s56, other.s56, t)!,
      s64: lerpDouble(s64, other.s64, t)!,
    );
  }
}
