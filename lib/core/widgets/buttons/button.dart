import 'package:flutter/material.dart';

import 'package:flutter_quote_generator_v2/core/theme/button/button_size_properties.dart';
import 'package:flutter_quote_generator_v2/core/theme/theme.dart';

enum AppButtonSize {
  xs,
  sm,
  md,
  lg,
}

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.isFullWidth = false,
    this.showBorder = false,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.borderWidth,
    this.disabledOpacityValue,
    this.gap,
    this.height,
    this.width,
    this.padding,
    this.buttonSize,
    this.onTap,
    this.leading,
    this.label,
    this.trailing,
  });

  final bool isFullWidth;
  final bool showBorder;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final double? disabledOpacityValue;
  final double? gap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final AppButtonSize? buttonSize;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? label;
  final Widget? trailing;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool get _isEnabled => widget.onTap != null;

  AppButtonSizeProperties _getAppButtonSize(
    BuildContext context,
    AppButtonSize? buttonSize,
  ) {
    switch (buttonSize) {
      case AppButtonSize.xs:
        return context.appTheme.buttonTheme.sizes.xs;
      case AppButtonSize.sm:
        return context.appTheme.buttonTheme.sizes.sm;
      case AppButtonSize.md:
        return context.appTheme.buttonTheme.sizes.md;
      case AppButtonSize.lg:
        return context.appTheme.buttonTheme.sizes.lg;
      default:
        return context.appTheme.buttonTheme.sizes.md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppButtonSizeProperties effectiveButtonSize =
        _getAppButtonSize(context, widget.buttonSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        widget.borderRadius ?? effectiveButtonSize.borderRadius;

    final Color effectiveBorderColor =
        widget.borderColor ?? context.appTheme.buttonTheme.colors.borderColor;

    final double effectiveBorderWidth =
        widget.borderWidth ?? context.appBorders.defaultBorderWidth;

    final Color effectiveTextColor =
        widget.textColor ?? context.appTheme.buttonTheme.colors.textColor;

    final double effectiveHeight = widget.height ?? effectiveButtonSize.height;

    final double effectiveGap = widget.gap ?? effectiveButtonSize.gap;

    final EdgeInsetsGeometry effectivePadding =
        widget.padding ?? effectiveButtonSize.padding;

    final EdgeInsets resolvedDirectionalPadding =
        effectivePadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedPadding = widget.padding == null
        ? EdgeInsetsDirectional.fromSTEB(
            widget.leading == null && widget.label != null
                ? resolvedDirectionalPadding.left
                : 0,
            resolvedDirectionalPadding.top,
            widget.trailing == null && widget.label != null
                ? resolvedDirectionalPadding.right
                : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    final borderShape = RoundedRectangleBorder(
      borderRadius: effectiveBorderRadius,
      side: BorderSide(
        color: effectiveBorderColor,
        width: widget.showBorder ? effectiveBorderWidth : 0,
        style: widget.showBorder ? BorderStyle.solid : BorderStyle.none,
      ),
    );

    return Material(
      borderRadius: effectiveBorderRadius,
      color: widget.backgroundColor ?? Colors.transparent,
      child: DefaultTextStyle(
        style:
            effectiveButtonSize.textStyle.copyWith(color: effectiveTextColor),
        child: InkWell(
          customBorder: borderShape,
          onTap: widget.onTap,
          child: Container(
            width: widget.width,
            height: effectiveHeight,
            constraints: BoxConstraints(minWidth: effectiveHeight),
            decoration: ShapeDecoration(shape: borderShape),
            child: Padding(
              padding: widget.isFullWidth ? EdgeInsets.zero : correctedPadding,
              child: widget.isFullWidth
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        if (widget.leading != null)
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: effectiveGap),
                            alignment:
                                Directionality.of(context) == TextDirection.ltr
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                            child: widget.leading,
                          ),
                        if (widget.label != null)
                          Align(
                            child: widget.label,
                          ),
                        if (widget.trailing != null)
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: effectiveGap),
                            alignment:
                                Directionality.of(context) == TextDirection.ltr
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: widget.trailing,
                          ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.leading != null)
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: effectiveGap),
                            child: widget.leading,
                          ),
                        if (widget.label != null) widget.label!,
                        if (widget.trailing != null)
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: effectiveGap),
                            child: widget.trailing,
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
