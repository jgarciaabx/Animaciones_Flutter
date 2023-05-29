import 'package:flutter/material.dart';
import 'package:flutter_animation/pagNavegator/navegacior_routes.dart';
import 'package:flutter_animation/page404/page_error.dart';
import 'package:flutter_animation/tweenAnimationBuilder/tween_animation.dart';
import 'package:flutter_animation/tweenAnimationBuilder/tween_animation_list.dart';
import 'package:flutter_animation/tweenAnimationBuilder/tween_animation_three.dart';

import 'tweenAnimationBuilder/tween_animation_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routes = {
    '/': (context) => const NavegaciorRoutes(),
    '/tweenAnimation': (context) => const TweenAnimation(),
    '/tweenAnimation2': (context) =>
        const TweenAnimationBuilderAnimation2(title: "Data"),
    '/tweenAnimation3': (context) =>
        const TweenAnimationBuilderAnimation3(title: "Data"),
    '/tweenAnimation4': (context) => TweenAnimationBuilderAnimationList(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Page_Error(),
      ),
    );
  }
}
