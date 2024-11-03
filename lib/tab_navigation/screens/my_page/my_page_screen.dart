import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyPageShellScreen extends StatelessWidget {
  const MyPageShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

@RoutePage()
class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPageScreen'),
        actions: [
          ElevatedButton(
            onPressed: () => context.router.push(MyPageSubRoute()),
            child: Text('to sub page'),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(
          30,
          (index) {
            return Container(
              height: 50,
              color:
                  index % 2 == 0 ? Colors.white : Colors.green.withOpacity(0.5),
              child: Center(
                child: Text(index.toString(), style: TextStyle(fontSize: 24)),
              ),
            );
          },
        ),
      ),
    );
  }
}

@RoutePage()
class MyPageSubScreen extends StatelessWidget {
  const MyPageSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPageSubScreen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.router.push(WithBottomNavRoute()),
                child: Text('Go to Page with Bottom Navigation'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.router.push(WithoutBottomNavRoute()),
                child: Text('Go to Page without Bottom Navigation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class WithBottomNavScreen extends StatelessWidget {
  const WithBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WithBottomNavScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('With Bottom Navigation', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.router.push(SampleDialogRoute()),
              child: Text('dialogs in tab'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.router.push(SampleBottomSheetRoute()),
              child: Text('dialogs in bottom sheet'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: context.maybePop, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class WithoutBottomNavScreen extends StatelessWidget {
  const WithoutBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WithoutBottomNavScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Without Bottom Navigation',
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: context.maybePop, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
