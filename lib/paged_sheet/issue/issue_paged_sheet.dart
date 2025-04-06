import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/paged_sheet/issue/issue_paged_sheet.gr.dart';
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
  generateForDir: ['lib/paged_sheet'],
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
          customRouteBuilder: <T>(_, child, page) {
            return PagedSheetRoute(
              initialOffset: const SheetOffset(0.5),
              snapGrid: SheetSnapGrid(
                snaps: [const SheetOffset(0.9), const SheetOffset(0.5)],
              ),
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
      children: [Scaffold(), SheetViewport(child: PagedSheetNavigator())],
    );
  }
}

class PagedSheetNavigator extends StatelessWidget {
  const PagedSheetNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedSheet(
      decoration: MaterialSheetDecoration(
        size: SheetSize.stretch,
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
