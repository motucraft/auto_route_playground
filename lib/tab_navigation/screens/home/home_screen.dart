import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  ref.read(routerProvider).push(SampleDialogRoute()),
              child: Text('open dialog'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  ref.read(routerProvider).push(SampleBottomSheetRoute()),
              child: Text('open bottom-sheet'),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () =>
                  ref.read(routerProvider).push(GlobalSampleDialogRoute()),
              child: Text('open global dialog'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  ref.read(routerProvider).push(GlobalSampleBottomSheetRoute()),
              child: Text('open global bottom-sheet'),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class SampleDialogScreen extends StatelessWidget {
  const SampleDialogScreen({super.key});

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
class SampleBottomSheetScreen extends StatelessWidget {
  const SampleBottomSheetScreen({super.key});

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
