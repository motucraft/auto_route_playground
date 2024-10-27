import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.builder(
      builder: (_, children, tabsRouter) {
        return Scaffold(
          // NOTE: When the Home tab (index 0) is active, show only the Home widget.
          //   This prevents other tabs from being kept in the IndexedStack, which effectively resets them.
          //   For other tabs, use IndexedStack to preserve their states.
          body: tabsRouter.activeIndex == 0
              ? children[tabsRouter.activeIndex]
              : IndexedStack(
                  index: tabsRouter.activeIndex,
                  children: children,
                ),
          bottomNavigationBar: buildBottomNav(tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(TabsRouter tabsRouter) {
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
