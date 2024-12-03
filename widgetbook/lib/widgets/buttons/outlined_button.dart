import 'package:flutter/cupertino.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/borders.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/outlined_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppOutlinedButton)
Widget buildAppOutlinedButtonUseCase(BuildContext context) {
  return AppOutlinedButton(
    onTap: () {},
    buttonSize: context.knobs.list<AppButtonSize>(
      label: 'Button Size',
      initialOption: AppButtonSize.sm,
      options: AppButtonSize.values,
    ),
    borderRadius: context.knobs.list<BorderRadius>(
      label: 'Border Radius',
      initialOption: BorderRadius.circular(
        AppBorders.borders.borderRadiusSm,
      ),
      options: [
        BorderRadius.circular(
          AppBorders.borders.borderRadiusXs,
        ),
        BorderRadius.circular(
          AppBorders.borders.borderRadiusSm,
        ),
        BorderRadius.circular(
          AppBorders.borders.borderRadiusMd,
        ),
        BorderRadius.circular(
          AppBorders.borders.borderRadiusLg,
        ),
        BorderRadius.circular(
          AppBorders.borders.borderRadiusFull,
        ),
      ],
    ),
    label: Text(
      context.knobs.string(
        label: 'Label',
        initialValue: 'การทดลองสิ่งมหัศจรรย์',
      ),
    ),
  );
}
