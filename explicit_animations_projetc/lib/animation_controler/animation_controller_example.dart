import 'package:flutter/material.dart';

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({Key? key}) : super(key: key);

  @override
  _AnimationControllerExampleState createState() => _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late String _statusDescription;

  final Animatable<double> _widthTween = Tween<double>(begin: .0, end: 350.0)
      .chain(CurveTween(curve: Curves.bounceOut));
  final Animatable<double> _heightTween = Tween<double>(begin: .0, end: 350.0)
      .chain(CurveTween(curve: Curves.bounceOut));
  final ColorTween _colorTween = ColorTween(
      begin: Colors.redAccent,
      end: Colors.pinkAccent
  );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    _controller.addListener(() {
      _updateState();
    });
    _controller.addStatusListener(_animationStatus);
    _controller.repeat(reverse: true);
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
      case AnimationStatus.forward:
        _statusDescription = 'Going forward...';
        break;
      case AnimationStatus.reverse:
        _statusDescription = 'Going back...';
        break;
      default:
        _statusDescription = 'Example completed';
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
            width: _widthTween.evaluate(_controller),
            height: _heightTween.evaluate(_controller),
          ),
        ),
      ),
    );
  }
}
