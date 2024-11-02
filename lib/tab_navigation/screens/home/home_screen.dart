import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeShellScreen extends StatelessWidget {
  const HomeShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => router.push(SampleDialogRoute()),
              child: Text('open dialog'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => router.push(SampleBottomSheetRoute()),
              child: Text('open bottom-sheet'),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => router.push(GlobalSampleDialogRoute()),
              child: Text('open global dialog'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => router.push(GlobalSampleBottomSheetRoute()),
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
