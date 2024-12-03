import 'package:flutter/cupertino.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/borders.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/button.dart';
import 'package:flutter_quote_generator_v2/core/widgets/buttons/filled_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppFilledButton)
Widget buildAppFilledButtonUseCase(BuildContext context) {
  return AppFilledButton(
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
