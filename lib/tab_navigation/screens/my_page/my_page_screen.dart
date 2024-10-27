import 'package:auto_route/auto_route.dart';
import 'package:auto_route_playground/tab_navigation/router/router.gr.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text(
          'Without BottomNavigationBar',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
