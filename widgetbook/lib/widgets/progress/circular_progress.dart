import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_quote_generator_v2/core/widgets/progress/circular_progress.dart';

@widgetbook.UseCase(name: 'Default', type: AppCircularProgress)
Widget buildAppFilledButtonUseCase(BuildContext context) {
  return AppCircularProgress(
    circularProgressSize: context.knobs.list(
      label: 'Circular Progress Size',
      options: AppCircularProgressSize.values,
      initialOption: AppCircularProgressSize.md,
    ),
  );
}
