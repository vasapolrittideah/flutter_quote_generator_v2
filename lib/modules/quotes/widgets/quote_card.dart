import 'package:flutter/cupertino.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/data/models/quote/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({required this.quote, super.key});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Quote
        Text(
          '"${quote.quote}"',
          textAlign: TextAlign.center,
          style: context.appTheme.tokens.typography.heading.text24,
        ),
        SizedBox(height: context.appTheme.tokens.sizes.s16),
        // Author
        Text(
          '- ${quote.author} -',
          textAlign: TextAlign.center,
          style: context.appTheme.tokens.typography.body.textDefault.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
