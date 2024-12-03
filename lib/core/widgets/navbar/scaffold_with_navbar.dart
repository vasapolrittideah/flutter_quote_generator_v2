import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_quote_generator_v2/core/theme/theme.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: context.appTheme.tokens.colors.outline,
              width: context.appTheme.tokens.borders.defaultBorderWidth,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: context.appTheme.tokens.colors.surface,
          currentIndex: navigationShell.currentIndex,
          selectedLabelStyle:
              context.appTheme.tokens.typography.body.textDefault,
          unselectedLabelStyle: context.appTheme.tokens.typography.body.text12,
          selectedItemColor: context.appTheme.tokens.colors.primary,
          onTap: _onTap,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circle),
              activeIcon: FaIcon(FontAwesomeIcons.solidCircle),
              label: 'Quote',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              activeIcon: FaIcon(FontAwesomeIcons.solidHeart),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
