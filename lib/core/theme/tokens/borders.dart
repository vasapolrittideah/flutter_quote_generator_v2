import 'dart:ui';

import 'package:flutter/material.dart';

final class AppBorders extends ThemeExtension<AppBorders> {

  const AppBorders({
    required this.borderRadiusXs,
    required this.borderRadiusSm,
    required this.borderRadiusMd,
    required this.borderRadiusLg,
    required this.borderRadiusFull,
    required this.defaultBorderWidth,
    required this.activeBorderWidth,
  });
  static const borders = AppBorders(
    borderRadiusXs: 4.0,
    borderRadiusSm: 8.0,
    borderRadiusMd: 12.0,
    borderRadiusLg: 16.0,
    borderRadiusFull: 999.0,
    defaultBorderWidth: 1.0,
    activeBorderWidth: 1.5,
  );

  final double borderRadiusXs;
  final double borderRadiusSm;
  final double borderRadiusMd;
  final double borderRadiusLg;
  final double borderRadiusFull;
  final double defaultBorderWidth;
  final double activeBorderWidth;

  @override
  AppBorders copyWith({
    double? borderRadiusXs,
    double? borderRadiusSm,
    double? borderRadiusMd,
    double? borderRadiusLg,
    double? borderRadiusFull,
    double? defaultBorderWidth,
    double? activeBorderWidth,
  }) {
    return AppBorders(
      borderRadiusXs: borderRadiusXs ?? this.borderRadiusXs,
      borderRadiusSm: borderRadiusSm ?? this.borderRadiusSm,
      borderRadiusMd: borderRadiusMd ?? this.borderRadiusMd,
      borderRadiusLg: borderRadiusLg ?? this.borderRadiusLg,
      borderRadiusFull: borderRadiusFull ?? this.borderRadiusFull,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
      activeBorderWidth: activeBorderWidth ?? this.activeBorderWidth,
    );
  }

  @override
  AppBorders lerp(ThemeExtension<AppBorders>? other, double t) {
    if (other is! AppBorders) {
      return this;
    }

    return AppBorders(
      borderRadiusXs: lerpDouble(borderRadiusXs, other.borderRadiusXs, t)!,
      borderRadiusSm: lerpDouble(borderRadiusSm, other.borderRadiusSm, t)!,
      borderRadiusMd: lerpDouble(borderRadiusMd, other.borderRadiusMd, t)!,
      borderRadiusLg: lerpDouble(borderRadiusLg, other.borderRadiusLg, t)!,
      borderRadiusFull:
          lerpDouble(borderRadiusFull, other.borderRadiusFull, t)!,
      defaultBorderWidth:
          lerpDouble(defaultBorderWidth, other.defaultBorderWidth, t)!,
      activeBorderWidth:
          lerpDouble(activeBorderWidth, other.activeBorderWidth, t)!,
    );
  }
}
