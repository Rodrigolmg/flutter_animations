import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late String _statusDescription;

  final Animatable<double> _widthTween = Tween<double>(begin: .0, end: 350.0);
  final Animatable<double> _heightTween = Tween<double>(begin: .0, end: 350.0);
  final ColorTween _colorTween = ColorTween(
      begin: Colors.redAccent,
      end: Colors.pinkAccent
  );

  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    _widthAnimation = _widthTween.animate(_controller);
    _heightAnimation = _heightTween.animate(_controller);
    _widthAnimation.addListener(_updateState);
    _heightAnimation.addListener(_updateState);
    _curvedAnimation = CurvedAnimation(parent: _controller,
        curve: Curves.easeIn, reverseCurve: Curves.bounceOut);
    _curvedAnimation.addStatusListener(_animationStatus);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateState(){
    setState(() {
    });
  }

  void _animationStatus(AnimationStatus status){
    switch(status){
      case AnimationStatus.dismissed:
        _controller.forward();
        _statusDescription = 'Going forward...';
        break;
      case AnimationStatus.completed:
        _controller.reverse();
        _statusDescription = 'Going back...';
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text('Animation is: $_statusDescription')),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: _colorTween.evaluate(_controller)
            ),
            width: _widthTween.evaluate(_curvedAnimation),
            height: _heightTween.evaluate(_curvedAnimation),
          ),
        ),
      ),
    );
  }
}
