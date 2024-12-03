import 'dart:ui';

import 'package:flutter/material.dart';

final class AppButtonSizeProperties
    extends ThemeExtension<AppButtonSizeProperties> {
  const AppButtonSizeProperties({
    required this.borderRadius,
    required this.gap,
    required this.height,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  final BorderRadiusGeometry borderRadius;
  final double gap;
  final double height;
  final double iconSizeValue;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  @override
  AppButtonSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    double? height,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return AppButtonSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  AppButtonSizeProperties lerp(
    ThemeExtension<AppButtonSizeProperties>? other,
    double t,
  ) {
    if (other is! AppButtonSizeProperties) {
      return this;
    }
    return AppButtonSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }
}
