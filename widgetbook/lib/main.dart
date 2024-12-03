import 'package:flutter/material.dart';
import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          extensions: <ThemeExtension<dynamic>>[
            AppTheme(tokens: AppTokens.light),
          ],
        ),
        home: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
        ),
      ),
      directories: directories,
    );
  }
}
