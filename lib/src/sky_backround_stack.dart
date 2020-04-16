import 'package:flutter/material.dart';
import 'floating_clouds.dart';
import 'blue_backdrop.dart';

class SkyBackground extends StatelessWidget {
  final Widget child;

  const SkyBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: BlueBackdrop()),
        Positioned.fill(child: FloatingClouds()),
        Positioned.fill(child: child)
      ],
    );
  }
}
