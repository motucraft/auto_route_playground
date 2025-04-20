import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/paged_sheet/issue/issue_maintain_state/issue_maintain_state.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      children: [
        CustomRoute(
          initial: true,
          maintainState: false,
          page: FirstSheetRoute.page,
          customRouteBuilder: <T>(_, child, page) {
            return PagedSheetRoute(
              initialOffset: const SheetOffset(1),
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
class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useRef(0);

    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.value++;
                    debugPrint('navigate value=${counter.value}');
                    context.router.navigate(
                      FirstSheetRoute(value: counter.value),
                    );
                  },
                  child: Text('countup with navigate'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    counter.value++;
                    debugPrint('replace value=${counter.value}');
                    context.router.replace(
                      FirstSheetRoute(value: counter.value),
                    );
                  },
                  child: Text('countup with replace'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    counter.value++;
                    debugPrint('popAndPush value=${counter.value}');
                    context.router.popAndPush(
                      FirstSheetRoute(value: counter.value),
                    );
                  },
                  child: Text('countup with popAndPush'),
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
  const FirstSheetScreen({super.key, this.value = 0});

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.blue.shade200,
      child: Center(
        child: Text(value.toString(), style: TextStyle(fontSize: 36)),
      ),
    );
  }
}
