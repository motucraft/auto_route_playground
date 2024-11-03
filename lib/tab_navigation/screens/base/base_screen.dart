import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.dart';
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
    final hideBottomNav = tabsRouter.topMatch.meta[hideBottomNavKey] == true;
    return hideBottomNav
        ? SizedBox()
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (tabsRouter.activeIndex == index) {
                // If the current tab is tapped again, pop to the root of that tab's stack
                tabsRouter
                    .innerRouterOf<StackRouter>(tabsRouter.current.name)
                    ?.popUntilRoot();
              } else {
                tabsRouter.setActiveIndex(index);
              }
            },
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
