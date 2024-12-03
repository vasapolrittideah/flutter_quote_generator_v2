// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/widgets/buttons/filled_button.dart' as _i2;
import 'package:widgetbook_workspace/widgets/buttons/outlined_button.dart'
    as _i3;
import 'package:widgetbook_workspace/widgets/progress/circular_progress.dart'
    as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'core',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookFolder(
            name: 'buttons',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppFilledButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i2.buildAppFilledButtonUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'AppOutlinedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.buildAppOutlinedButtonUseCase,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'progress',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppCircularProgress',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i4.buildAppFilledButtonUseCase,
                ),
              )
            ],
          ),
        ],
      )
    ],
  )
];
