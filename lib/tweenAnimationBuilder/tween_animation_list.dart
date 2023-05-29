import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

class TweenAnimationBuilderAnimationList extends StatefulWidget {
  @override
  _TweenAnimationBuilderAnimationListState createState() =>
      _TweenAnimationBuilderAnimationListState();
}

class _TweenAnimationBuilderAnimationListState
    extends State<TweenAnimationBuilderAnimationList>
    with SingleTickerProviderStateMixin {
  List<String> _images = [
    'assets/images/imagen5.png',
    'assets/images/imagen5.png',
    'assets/images/imagen5.png',
  ];

  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    final tickerProvider = MyTickerProvider();

    _controllers = List.generate(
      _images.length,
      (index) => AnimationController(
        duration: Duration(seconds: 2),
        vsync: tickerProvider,
      )..repeat(reverse: true),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listado de imágenes animadas'),
        ),
        body: ListView.builder(
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return AnimatedImage(
              imagePath: _images[index],
              animationController: _controllers[index],
              animation: _animations[index],
            );
          },
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  final String imagePath;
  final AnimationController animationController;
  final Animation<double> animation;

  AnimatedImage({
    required this.imagePath,
    required this.animationController,
    required this.animation,
  });

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  @override
  void initState() {
    super.initState();
    widget.animationController.forward();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(widget.animation.value * 100.0, 0.0),
          child: Image.asset(
            widget.imagePath,
            width: 200.0,
            height: 200.0,
          ),
        );
      },
    );
  }
}
