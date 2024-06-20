// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/src/features/authentication/presentation/screens/home_screen.dart'
    as _i1;
import 'package:app/src/features/authentication/presentation/screens/lock_screen.dart'
    as _i2;
import 'package:app/src/features/authentication/presentation/screens/login_screen.dart'
    as _i3;
import 'package:app/src/features/main/presentation/screen/main_screen.dart'
    as _i5;
import 'package:app/src/routing/app_router.dart' as _i4;
import 'package:app/src/shared/presentation/screen/splash_screen.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LockRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LockScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    MainRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainScreen(),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LockScreen]
class LockRoute extends _i7.PageRouteInfo<void> {
  const LockRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LockRoute.name,
          initialChildren: children,
        );

  static const String name = 'LockRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<LoginRouteArgs> page =
      _i7.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.MainRouterPage]
class MainRouter extends _i7.PageRouteInfo<void> {
  const MainRouter({List<_i7.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreenPage]
class SplashRoutePage extends _i7.PageRouteInfo<void> {
  const SplashRoutePage({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
