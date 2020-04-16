import 'package:flutter/material.dart';

class FloatingClouds extends StatefulWidget {
  @override
  _FloatingCloudsState createState() => _FloatingCloudsState();
}

class _FloatingCloudsState extends State<FloatingClouds>
    with TickerProviderStateMixin {
  ///controls far clouds
  AnimationController _controllerSlow;

  ///controls far clouds
  AnimationController _controllerNormal;

  ///every cloud has its own offset position
  Animation<Offset> _offsetAnimation1;
  Animation<Offset> _offsetAnimation2;
  Animation<Offset> _offsetAnimation3;
  Animation<Offset> _offsetAnimation4;
  Animation<Offset> _offsetAnimation5;

  @override
  void initState() {
    super.initState();

    _controllerSlow = AnimationController(
      duration: const Duration(seconds: 85),
      vsync: this,
    )..repeat();
    _controllerNormal = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
    _offsetAnimation1 = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(2.0, 0.0),
    ).animate(CurvedAnimation(parent: _controllerSlow, curve: Curves.linear));
    _offsetAnimation2 = Tween<Offset>(
      begin: Offset(-2.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(CurvedAnimation(parent: _controllerSlow, curve: Curves.linear));
    _offsetAnimation3 = Tween<Offset>(
      begin: Offset(-2.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(CurvedAnimation(parent: _controllerNormal, curve: Curves.linear));
    _offsetAnimation4 = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(2.0, 0.0),
    ).animate(CurvedAnimation(parent: _controllerNormal, curve: Curves.linear));
    _offsetAnimation5 = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset(1.5, 0.0),
    ).animate(CurvedAnimation(parent: _controllerNormal, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SlideTransition(
              position: _offsetAnimation1,
              child: Image(
                image: AssetImage('lib/assets/cloud2.png',
                    package: 'sky_background'),
              ),
            ),
            SlideTransition(
              position: _offsetAnimation2,
              child: Image(
                image: AssetImage('lib/assets/cloud5.png',
                    package: 'sky_background'),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SlideTransition(
              position: _offsetAnimation3,
              child: Image(
                image: AssetImage('lib/assets/cloud3.png',
                    package: 'sky_background'),
              ),
            ),
            SlideTransition(
              position: _offsetAnimation4,
              child: Image(
                image: AssetImage('lib/assets/cloud4.png',
                    package: 'sky_background'),
              ),
            ),
            SlideTransition(
              position: _offsetAnimation5,
              child: Image(
                image: AssetImage('lib/assets/cloud1.png',
                    package: 'sky_background'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerSlow.dispose();
    _controllerNormal.dispose();
  }
}
