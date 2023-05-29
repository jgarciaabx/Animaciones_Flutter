import 'package:flutter/material.dart';

class TweenAnimationBuilderAnimation3 extends StatefulWidget {
  const TweenAnimationBuilderAnimation3({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<TweenAnimationBuilderAnimation3> createState() =>
      _TweenAnimationBuilderAnimation3State();
}

class _TweenAnimationBuilderAnimation3State
    extends State<TweenAnimationBuilderAnimation3> {
  int _counter = 0;
  int _oldcounter = 0;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 80);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
          
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                key: Key(
                  _counter.toString(),
                ),
                duration: Duration(seconds: 2),
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      if (_oldcounter != null)
                        Opacity(
                          opacity: 1 - value,
                          child: Transform.translate(
                            offset: Offset(50 * value, 0.0),
                            child: Text(_oldcounter.toString(), style: style),
                          ),
                        ),
                      Opacity(
                        opacity: value,
                        child: Transform.translate(
                            offset: Offset(-50 * (1 - value), 0.0),
                            child: Text(_counter.toString(), style: style)),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _oldcounter = _counter;
            setState(() {
              _counter++;
            });
          },
        ));
  }
}
