import 'dart:ui';

import 'package:flutter/material.dart';

final class AppOpacities extends ThemeExtension<AppOpacities> {

  const AppOpacities({required this.disabled});
  static const opacities = AppOpacities(disabled: 0.5);

  final double disabled;

  @override
  AppOpacities copyWith({double? disabled}) {
    return AppOpacities(
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  AppOpacities lerp(ThemeExtension<AppOpacities>? other, double t) {
    if (other is! AppOpacities) {
      return this;
    }

    return AppOpacities(
      disabled: lerpDouble(disabled, other.disabled, t)!,
    );
  }
}
