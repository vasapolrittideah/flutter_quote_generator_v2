import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:flutter_quote_generator_v2/core/theme/theme.dart';

enum AppCircularProgressSize {
  xs,
  sm,
  md,
  lg,
}

final class AppCircularProgress extends StatelessWidget {
  const AppCircularProgress({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    this.circularProgressSize,
  });

  final Color? color;
  final Color? backgroundColor;
  final double? sizeValue;
  final double? strokeWidth;
  final AppCircularProgressSize? circularProgressSize;

  AppCircularProgressSizeProperties _getAppCircularProgressSize(
    BuildContext context,
    AppCircularProgressSize? circularProgressSize,
  ) {
    switch (circularProgressSize) {
      case AppCircularProgressSize.xs:
        return context.appTheme.circularProgressTheme.sizes.xs;
      case AppCircularProgressSize.sm:
        return context.appTheme.circularProgressTheme.sizes.sm;
      case AppCircularProgressSize.md:
        return context.appTheme.circularProgressTheme.sizes.md;
      case AppCircularProgressSize.lg:
        return context.appTheme.circularProgressTheme.sizes.lg;
      default:
        return context.appTheme.circularProgressTheme.sizes.md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor =
        color ?? context.appTheme.circularProgressTheme.colors.color;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.appTheme.circularProgressTheme.colors.backgroundColor;

    final AppCircularProgressSizeProperties effectiveCircularProgressSize =
        _getAppCircularProgressSize(context, circularProgressSize);

    final double effectiveSize =
        sizeValue ?? effectiveCircularProgressSize.progressSizeValue;

    final double effectiveStrokeWidth =
        strokeWidth ?? effectiveCircularProgressSize.progressStrokeWidth;

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: CircularProgressIndicator(
        color: effectiveColor,
        backgroundColor: effectiveBackgroundColor,
        strokeWidth: effectiveStrokeWidth,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
