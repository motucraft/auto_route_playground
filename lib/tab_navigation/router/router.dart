import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
AppRouter router(Ref ref) {
  return AppRouter(
    homeShellRoute: ref.watch(homeShellRouteProvider),
    favoritesShellRoute: ref.watch(favoritesShellRouteProvider),
    postsShellRoute: ref.watch(postsShellRouteProvider),
    myPageShellRoute: ref.watch(myPageShellRouteProvider),
  );
}

@riverpod
EmptyShellRoute homeShellRoute(Ref ref) => EmptyShellRoute('Home');

@riverpod
EmptyShellRoute favoritesShellRoute(Ref ref) => EmptyShellRoute('Favorite');

@riverpod
EmptyShellRoute postsShellRoute(Ref ref) => EmptyShellRoute('Posts');

@riverpod
EmptyShellRoute myPageShellRoute(Ref ref) => EmptyShellRoute('MyPage');

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  generateForDir: ['lib/tab_navigation'],
)
class AppRouter extends RootStackRouter {
  final EmptyShellRoute homeShellRoute;
  final EmptyShellRoute favoritesShellRoute;
  final EmptyShellRoute postsShellRoute;
  final EmptyShellRoute myPageShellRoute;

  AppRouter({
    required this.homeShellRoute,
    required this.favoritesShellRoute,
    required this.postsShellRoute,
    required this.myPageShellRoute,
  }) : super() {
    routes = [
      AutoRoute(
        page: BaseRoute.page,
        initial: true,
        children: [
          AutoRoute(
            page: homeShellRoute.page,
            initial: true,
            children: [
              AutoRoute(
                initial: true,
                page: HomeRoute.page,
              ),
              CustomRoute(
                page: SampleDialogRoute.page,
                customRouteBuilder: <T>(context, child, page) {
                  return DialogRoute(
                    context: context,
                    settings: page,
                    builder: (_) => child,
                  );
                },
              ),
              CustomRoute(
                page: SampleBottomSheetRoute.page,
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
              ),
            ],
          ),
          AutoRoute(
            page: favoritesShellRoute.page,
            children: [
              AutoRoute(
                initial: true,
                page: FavoritesRoute.page,
              ),
            ],
          ),
          AutoRoute(
            page: postsShellRoute.page,
            children: [
              AutoRoute(
                initial: true,
                page: PostsRoute.page,
              ),
            ],
          ),
          AutoRoute(
            page: myPageShellRoute.page,
            children: [
              AutoRoute(
                initial: true,
                page: MyPageRoute.page,
              ),
            ],
          ),
        ],
      ),
      CustomRoute(
        page: GlobalSampleDialogRoute.page,
        customRouteBuilder: <T>(context, child, page) {
          return DialogRoute(
            context: context,
            settings: page,
            builder: (_) => child,
          );
        },
      ),
      CustomRoute(
        page: GlobalSampleBottomSheetRoute.page,
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
      ),
    ];
  }

  @override
  late final List<AutoRoute> routes;
}
