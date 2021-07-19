import 'package:animated_container_animations/styles.dart';
import 'package:animated_container_animations/widgets/container_to_animate.dart';
import 'package:animated_container_animations/widgets/demo_button.dart';
import 'package:flutter/material.dart';

class PaddingExample extends StatefulWidget {
  const PaddingExample({Key? key}) : super(key: key);

  @override
  _PaddingExampleState createState() => _PaddingExampleState();
}

class _PaddingExampleState extends State<PaddingExample> {
  static const _firstPadding = EdgeInsets.symmetric(vertical: 48);
  static const _secondPadding = EdgeInsets.all(16);

  var _isFirstState = true;

  var _padding = _firstPadding;

  void _changePadding() {
    EdgeInsets newPadding;
    if (_isFirstState) {
      newPadding = _secondPadding;
    } else {
      newPadding = _firstPadding;
    }
    _isFirstState = !_isFirstState;

    setState(() {
      _padding = newPadding;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(color: mustard),
        ),
        Column(
          children: <Widget>[
            AnimatedPadding(
              padding: _padding,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutBack,
              child: Container(
                color: Colors.orange,
                child: const ContainerToAnimate(),
              ),
            ),
            DemoButton(
              onPressed: _changePadding,
              label: 'Pad me',
            ),
          ],
        ),
        Expanded(
          child: Container(color: mustard),
        ),
      ],
    );
  }
}
