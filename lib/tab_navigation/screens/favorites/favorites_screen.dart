import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavoriteScreen'),
        actions: [
          ElevatedButton(
            onPressed: () => context.router.push(FavoritesSubRoute()),
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
                  index % 2 == 0 ? Colors.white : Colors.red.withOpacity(0.5),
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
class FavoritesSubScreen extends StatelessWidget {
  const FavoritesSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FavoritesSubScreen')),
      body: Center(child: Text('FavoritesSubScreen')),
    );
  }
}
