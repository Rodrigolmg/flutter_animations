import 'package:animated_container_animations/styles.dart';
import 'package:animated_container_animations/widgets/container_to_animate.dart';
import 'package:animated_container_animations/widgets/demo_button.dart';
import 'package:flutter/material.dart';

class CrossFadeExample extends StatefulWidget {
  const CrossFadeExample({Key? key}) : super(key: key);

  @override
  _CrossFadeExampleState createState() => _CrossFadeExampleState();
}

class _CrossFadeExampleState extends State<CrossFadeExample> {

  var _state = CrossFadeState.showFirst;

  void _changeState() {
    CrossFadeState newState;
    if (_state == CrossFadeState.showFirst) {
      newState = CrossFadeState.showSecond;
    } else {
      newState = CrossFadeState.showFirst;
    }
    setState(() {
      _state = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedCrossFade(
          firstChild: const ContainerToAnimate(
            color: teal,
          ),
          secondChild: FlutterLogo(size: 200),
          crossFadeState: _state,
          duration: Duration(milliseconds: 600)
        ),
        DemoButton(label: 'Change', onPressed: _changeState)
      ],
    );
  }
}
