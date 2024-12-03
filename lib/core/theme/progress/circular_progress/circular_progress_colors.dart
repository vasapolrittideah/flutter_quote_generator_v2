import 'package:flutter/material.dart';

final class AppCircularProgressColors
    extends ThemeExtension<AppCircularProgressColors> {

  const AppCircularProgressColors({
    required this.color,
    required this.backgroundColor,
  });
  final Color color;
  final Color backgroundColor;

  @override
  AppCircularProgressColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return AppCircularProgressColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  AppCircularProgressColors lerp(
      ThemeExtension<AppCircularProgressColors>? other, double t,) {
    if (other is! AppCircularProgressColors) {
      return this;
    }

    return AppCircularProgressColors(
      color: Color.lerp(color, other.color, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
