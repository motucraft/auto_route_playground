import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

const hideBottomNavKey = 'hideBottomNav';
final router = AppRouter();

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  generateForDir: ['lib/tab_navigation'],
)
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: BaseRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: HomeShellRoute.page,
          initial: true,
          children: [
            AutoRoute(initial: true, page: HomeRoute.page),
            _dialogCustomRoute(SampleDialogRoute.page),
            _bottomSheetCustomRoute(SampleBottomSheetRoute.page),
          ],
        ),
        AutoRoute(
          page: FavoritesShellRoute.page,
          children: [
            AutoRoute(initial: true, page: FavoritesRoute.page),
            AutoRoute(page: FavoritesSubRoute.page),
          ],
        ),
        AutoRoute(
          page: PostsShellRoute.page,
          children: [
            AutoRoute(initial: true, page: PostsRoute.page),
            AutoRoute(page: PostsSubRoute.page),
          ],
        ),
        AutoRoute(
          page: MyPageShellRoute.page,
          children: [
            AutoRoute(initial: true, page: MyPageRoute.page),
            AutoRoute(page: MyPageSubRoute.page),
            AutoRoute(page: WithBottomNavRoute.page),
            AutoRoute(
              page: WithoutBottomNavRoute.page,
              meta: {hideBottomNavKey: true},
            ),
            _dialogCustomRoute(SampleDialogRoute.page),
            _bottomSheetCustomRoute(SampleBottomSheetRoute.page),
          ],
        ),
      ],
    ),
    _dialogCustomRoute(GlobalSampleDialogRoute.page),
    _bottomSheetCustomRoute(GlobalSampleBottomSheetRoute.page),
  ];
}

AutoRoute _dialogCustomRoute(PageInfo page) {
  return CustomRoute(
    page: page,
    customRouteBuilder: <T>(context, child, page) {
      return DialogRoute(
        context: context,
        settings: page,
        builder: (_) => child,
      );
    },
  );
}

AutoRoute _bottomSheetCustomRoute(PageInfo page) {
  return CustomRoute(
    page: page,
    customRouteBuilder: <T>(context, child, page) {
      return ModalBottomSheetRoute(
        settings: page,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height / 2,
        ),
        useSafeArea: true,
        showDragHandle: true,
        elevation: 1.0,
        builder: (context) => child,
      );
    },
  );
}
