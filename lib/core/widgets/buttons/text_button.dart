import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/button.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.isFullWidth = false,
    this.borderRadius,
    this.borderColor,
    this.height,
    this.width,
    this.buttonSize,
    this.onTap,
    this.leading,
    this.label,
    this.trailing,
  });

  final bool isFullWidth;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final double? height;
  final double? width;
  final AppButtonSize? buttonSize;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor =
        context.appTheme.buttonTheme.colors.textVariantTextColor;

    return AppButton(
      isFullWidth: isFullWidth,
      borderRadius: borderRadius,
      textColor: effectiveTextColor,
      borderColor: borderColor,
      backgroundColor: Colors.transparent,
      showBorder: false,
      height: height,
      width: width,
      buttonSize: buttonSize,
      onTap: onTap,
      leading: leading,
      label: label,
      trailing: trailing,
    );
  }
}
