import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/paged_sheet/issue/issue_fullscreen_on_toggle/issue_fullscreen_on_toggle.gr.dart';
import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouter().config());
  }
}

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  generateForDir: ['lib/paged_sheet/issue/issue_fullscreen_on_toggle'],
)
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      children: [
        CustomRoute(
          initial: true,
          page: FirstSheetRoute.page,
          maintainState: false,
          customRouteBuilder: <T>(_, child, page) {
            return PagedSheetRoute(
              maintainState: false,
              initialOffset: const SheetOffset(0.3),
              scrollConfiguration: SheetScrollConfiguration(),
              settings: page,
              builder: (_) => child,
            );
          },
        ),
        CustomRoute(
          page: SecondSheetRoute.page,
          maintainState: false,
          customRouteBuilder: <T>(_, child, page) {
            return PagedSheetRoute(
              maintainState: false,
              initialOffset: const SheetOffset(0.3),
              scrollConfiguration: SheetScrollConfiguration(),
              settings: page,
              builder: (_) => child,
            );
          },
        ),
      ],
    ),
  ];
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => context.router.navigate(FirstSheetRoute()),
                  child: Text('navigate to FirstSheetRoute'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => context.router.navigate(SecondSheetRoute()),
                  child: Text('navigate to SecondSheetRoute'),
                ),
              ],
            ),
          ),
        ),
        SheetViewport(child: PagedSheetNavigator()),
      ],
    );
  }
}

class PagedSheetNavigator extends StatelessWidget {
  const PagedSheetNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedSheet(
      decoration: MaterialSheetDecoration(
        size: SheetSize.fit,
        color: Colors.white,
      ),
      navigator: AutoRouter(),
    );
  }
}

@RoutePage()
class FirstSheetScreen extends StatelessWidget {
  const FirstSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue.shade200,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) {
            return Text('$index');
          }),
        ),
      ),
    );
  }
}

@RoutePage()
class SecondSheetScreen extends StatelessWidget {
  const SecondSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red.shade200,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) {
            return Text('$index');
          }),
        ),
      ),
    );
  }
}
