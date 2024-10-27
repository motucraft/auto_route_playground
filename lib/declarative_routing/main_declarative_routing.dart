import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/declarative_routing/main_declarative_routing.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_declarative_routing.g.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider).config(),
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
        ),
      ),
    );
  }
}

@AutoRouterConfig(generateForDir: ['lib/declarative_routing'])
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: HomeRoute.page, initial: true),
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
    ];
  }
}

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                // Routing without BuildContext
                onPressed: () =>
                    ref.read(routerProvider).push(SampleDialogRoute()),
                child: Text('open dialog'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                // Routing without BuildContext
                onPressed: () =>
                    ref.read(routerProvider).push(SampleBottomSheetRoute()),
                child: Text('open bottom-sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class SampleDialogPage extends StatelessWidget {
  const SampleDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('dialog with auto_route'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.maybePop(),
            child: Text('close'),
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class SampleBottomSheetPage extends StatelessWidget {
  const SampleBottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('bottom sheet with auto_route'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.maybePop(),
            child: Text('close'),
          ),
        ],
      ),
    );
  }
}

@riverpod
AppRouter router(Ref ref) => AppRouter();