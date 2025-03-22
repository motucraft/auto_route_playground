import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostsShellScreen extends StatelessWidget {
  const PostsShellScreen({super.key});

  @override
  Widget build(context) => AutoRouter();
}

@RoutePage()
class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostsScreen'),
        actions: [
          ElevatedButton(
            onPressed: () => context.router.push(PostsSubRoute()),
            child: Text('to sub page'),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(30, (index) {
          return Container(
            height: 50,
            color: index % 2 == 0 ? Colors.white : Colors.blue.withOpacity(0.5),
            child: Center(
              child: Text(index.toString(), style: TextStyle(fontSize: 24)),
            ),
          );
        }),
      ),
    );
  }
}

@RoutePage()
class PostsSubScreen extends StatelessWidget {
  const PostsSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PostsSubScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.navigate(FavoritesShellRoute()),
              child: Text('To Favorites'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.router.navigate(
                  FavoritesShellRoute(children: [FavoritesSubRoute()]),
                );
              },
              child: Text('To Favorites Subpage'),
            ),
          ],
        ),
      ),
    );
  }
}
