import 'package:flutter/material.dart';

final class AppShadows extends ThemeExtension<AppShadows> {

  const AppShadows({
    required this.sm,
    required this.md,
    required this.lg,
  });
  static const light = AppShadows(
    sm: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 6,
        offset: Offset(0, 6),
        spreadRadius: -6,
      ),
    ],
    md: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 12,
        offset: Offset(0, 12),
      ),
    ],
    lg: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 24,
        offset: Offset(0, 8),
      ),
    ],
  );

  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;

  @override
  AppShadows copyWith({
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
  }) {
    return AppShadows(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  AppShadows lerp(ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) {
      return this;
    }

    return AppShadows(
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
      lg: BoxShadow.lerpList(lg, other.lg, t)!,
    );
  }
}
