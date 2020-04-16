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
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
  }

  Animatable<Color> backgroundTopLeft = ColorTween(
      begin: Color.fromRGBO(1, 54, 193, 1),
      end: Color.fromRGBO(0, 110, 235, 1));

  Animatable<Color> backgroundBottomRight = ColorTween(
      begin: Color.fromRGBO(58, 173, 254, 1),
      end: Color.fromRGBO(231, 240, 254, 1));

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
