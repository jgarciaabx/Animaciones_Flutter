import 'package:flutter/material.dart';

class TweenAnimation extends StatelessWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        tween: ColorTween(begin: Colors.red, end: Colors.blue),
        builder: (context, value, _) {
          return Container(
            color: value,
            height: 100,
            width: 100,
          );
        },
      ),
    );
  }
}
