import 'package:flutter/material.dart';

class NavegaciorRoutes extends StatelessWidget {
  const NavegaciorRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("tweenAnimator"),
                onPressed: () {
                  Navigator.pushNamed(context, '/tweenAnimation');
                },
              ),
              ElevatedButton(
                child: Text("tweenAnimator2"),
                onPressed: () {
                  Navigator.pushNamed(context, '/tweenAnimation2');
                },
              ),
              ElevatedButton(
                child: Text("tweenAnimator3"),
                onPressed: () {
                  Navigator.pushNamed(context, '/tweenAnimation3');
                },
              ),
              ElevatedButton(
                child: Text("tweenAnimatorList"),
                onPressed: () {
                  Navigator.pushNamed(context, '/tweenAnimation4');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
