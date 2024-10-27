import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav
        ? SizedBox.shrink()
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'MyPage',
              ),
            ],
          );
  }
}

@RoutePage()
class GlobalSampleDialogScreen extends StatelessWidget {
  const GlobalSampleDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Global dialog with auto_route'),
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
