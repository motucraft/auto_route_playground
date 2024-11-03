import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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

@RoutePage()
class GlobalSampleBottomSheetScreen extends StatelessWidget {
  const GlobalSampleBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Global bottom sheet with auto_route'),
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
