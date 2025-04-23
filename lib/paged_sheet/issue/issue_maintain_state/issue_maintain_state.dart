import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/paged_sheet/issue/issue_maintain_state/issue_maintain_state.gr.dart';
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
  generateForDir: ['lib/paged_sheet/issue/issue_maintain_state'],
)
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      maintainState: false,
      children: [
        CustomRoute(
          initial: true,
          maintainState: false,
          page: FirstSheetRoute.page,
          customRouteBuilder: <T>(_, child, page) {
            return PagedSheetRoute(
              maintainState: false,
              initialOffset: const SheetOffset(1),
              scrollConfiguration: SheetScrollConfiguration(),
              settings: page,
              builder: (_) => child,
            );
          },
        ),
      ],
    ),
    AutoRoute(maintainState: false, page: NormalRoute.page),
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
                  onPressed: () {
                    context.router.navigate(FirstSheetRoute(value: _now()));
                  },
                  child: Text('navigate to FirstSheetRoute'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.router.replace(FirstSheetRoute(value: _now()));
                  },
                  child: Text('replace to FirstSheetRoute'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.router.popAndPush(FirstSheetRoute(value: _now()));
                  },
                  child: Text('popAndPush to FirstSheetRoute'),
                ),
                Divider(height: 36),
                ElevatedButton(
                  onPressed: () {
                    context.router.navigate(NormalRoute(value: _now()));
                  },
                  child: Text('navigate to NormalRoute'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.router.replace(NormalRoute(value: _now()));
                  },
                  child: Text('replace to NormalRoute'),
                ),
              ],
            ),
          ),
        ),
        SheetViewport(child: PagedSheetNavigator()),
      ],
    );
  }

  DateTime _now() {
    final now = DateTime.now();
    debugPrint('now=${now.toIso8601String()}');
    return now;
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
  const FirstSheetScreen({super.key, this.value});

  final DateTime? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue.shade200,
      child: Center(
        child: Text(
          value?.toIso8601String() ?? '',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

@RoutePage()
class NormalScreen extends StatelessWidget {
  const NormalScreen({super.key, this.value});

  final DateTime? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          value?.toIso8601String() ?? '',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
