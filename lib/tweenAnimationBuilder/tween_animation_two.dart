import 'package:flutter/material.dart';

class TweenAnimationBuilderAnimation2 extends StatelessWidget {
  const TweenAnimationBuilderAnimation2({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                child: Text('Juan'),
                duration: Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.translate(
                      offset: Offset(0.0, 200 * value), child: child);
                },
              ),
              SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/imagen5.png'),
                ),
                duration: Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.translate(
                      offset: Offset(200 * value, 0.0), child: child);
                },
              ),
              SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                child: Text(
                    'rimary value: Color(0xfff44336))" and "MaterialColor(primary value: Color(0xff2196'),
                duration: Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.translate(
                      offset: Offset(0.0, 300 * value), child: child);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
