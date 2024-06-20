import 'package:auto_route/auto_route.dart';
import 'package:app/src/routing/app_router.gr.dart';

AppRouter appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            path: '/', page: SplashRoutePage.page, barrierDismissible: false, transitionsBuilder: TransitionsBuilders.noTransition, initial: true),
        CustomRoute(path: '/lock', page: LockRoute.page, barrierDismissible: false, transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(path: '/home', page: HomeRoute.page, barrierDismissible: false, transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(path: '/login', page: LoginRoute.page, barrierDismissible: false, transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          path: '/main',
          page: MainRouter.page,
          barrierDismissible: false,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(path: '', page: MainRoute.page, initial: true, transitionsBuilder: TransitionsBuilders.noTransition),
          ],
        ),
      ];
}

@RoutePage(name: 'MainRouter')
class MainRouterPage extends AutoRouter {
  const MainRouterPage({super.key});
}
