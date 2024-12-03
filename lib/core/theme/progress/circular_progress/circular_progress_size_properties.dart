import 'dart:ui';

import 'package:flutter/material.dart';

final class AppCircularProgressSizeProperties
    extends ThemeExtension<AppCircularProgressSizeProperties> {

  const AppCircularProgressSizeProperties({
    required this.progressSizeValue,
    required this.progressStrokeWidth,
  });
  final double progressSizeValue;
  final double progressStrokeWidth;

  @override
  AppCircularProgressSizeProperties copyWith({
    double? progressSizeValue,
    double? progressStrokeWidth,
  }) {
    return AppCircularProgressSizeProperties(
      progressSizeValue: progressSizeValue ?? this.progressSizeValue,
      progressStrokeWidth: progressStrokeWidth ?? this.progressStrokeWidth,
    );
  }

  @override
  AppCircularProgressSizeProperties lerp(
      ThemeExtension<AppCircularProgressSizeProperties>? other, double t,) {
    if (other is! AppCircularProgressSizeProperties) {
      return this;
    }
    return AppCircularProgressSizeProperties(
      progressSizeValue:
          lerpDouble(progressSizeValue, other.progressSizeValue, t)!,
      progressStrokeWidth:
          lerpDouble(progressStrokeWidth, other.progressStrokeWidth, t)!,
    );
  }
}
