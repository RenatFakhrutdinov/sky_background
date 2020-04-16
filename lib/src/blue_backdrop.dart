import 'package:flutter/material.dart';

class BlueBackdrop extends StatefulWidget {
  @override
  _BlueBackdropState createState() => _BlueBackdropState();
}

class _BlueBackdropState extends State<BlueBackdrop>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> backgroundTopLeft = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
  ]);

  Animatable<Color> backgroundBottomRight = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.white,
        end: Colors.red,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.orangeAccent,
        end: Colors.black,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  backgroundTopLeft
                      .evaluate(AlwaysStoppedAnimation(_controller.value)),
                  backgroundBottomRight
                      .evaluate(AlwaysStoppedAnimation(_controller.value))
                ])),
          );
        });
  }
}
