import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_quote_generator_v2/core/di/injectable.dart';
import 'package:flutter_quote_generator_v2/core/l10n/generated/l10n.dart';
import 'package:flutter_quote_generator_v2/core/routes/app_router.dart';
import 'package:flutter_quote_generator_v2/core/theme/theme.dart';
import 'package:flutter_quote_generator_v2/core/theme/tokens/tokens.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/favorite_quote_bloc/favorite_quote_bloc.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/bloc/random_quote_bloc/random_quote_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final List<BlocProvider> _globalBlocProviders = [
    BlocProvider<RandomQuoteBloc>(
      create: (context) => getIt(),
    ),
    BlocProvider<FavoriteQuoteBloc>(
      create: (context) => getIt(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        return _setDefaultLocale(
          locales,
          supportedLocales,
          const Locale('th', 'TH'),
        );
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        extensions: <ThemeExtension<dynamic>>[
          AppTheme(tokens: AppTokens.light),
        ],
      ),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: _globalBlocProviders,
          child: Scaffold(
            backgroundColor: context.appTheme.tokens.colors.background,
            body: child!,
          ),
        );
      },
    );
  }

  Locale _setDefaultLocale(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
    Locale defaultLocale,
  ) {
    return locales?.firstWhere(
          (locale) => supportedLocales.contains(locale),
          orElse: () => defaultLocale,
        ) ??
        defaultLocale;
  }
}
