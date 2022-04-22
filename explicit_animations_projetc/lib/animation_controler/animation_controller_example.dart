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

  double _width = .0;
  double _height = .0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    _controller.addListener(() {
      _setValues(_controller.value);
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

  void _setValues(double value){
    setState(() {
      _width = value * 350;
      _height = value * 350;
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
            decoration: const BoxDecoration(
              color: Colors.redAccent
            ),
            width: _width,
            height: _height,
          ),
        ),
      ),
    );
  }
}
