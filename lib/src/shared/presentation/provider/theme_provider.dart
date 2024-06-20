import 'package:app/src/shared/domain/models/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final CustomTheme theme;

  const ThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  static CustomTheme of(BuildContext context) {
    final ThemeProvider? result = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;
}

class MyTheme extends StatelessWidget {
  final CustomTheme light;
  final CustomTheme dark;
  final Widget child;
  const MyTheme({
    required this.light,
    required this.dark,
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final theme = brightness == Brightness.light ? light : dark;

    return ThemeProvider(
      theme: theme,
      child: child,
    );
  }

  static CustomTheme of(BuildContext context) {
    return ThemeProvider.of(context);
  }
}
