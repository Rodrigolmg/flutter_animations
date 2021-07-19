import 'package:animated_container_animations/styles.dart';
import 'package:animated_container_animations/widgets/container_to_animate.dart';
import 'package:flutter/material.dart';

class AlignExample extends StatefulWidget {
  const AlignExample({Key? key}) : super(key: key);

  @override
  _AlignDemoState createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignExample> {
  Alignment _alignment = Alignment.center;

  void _changeAlignment(Alignment value) {
    setState(() {
      _alignment = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 800),
          curve: Curves.bounceIn,
          child: const ContainerToAnimate(color: salmon),
        ),
        AlignmentButton(
          alignment: Alignment.topLeft,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.topCenter,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.topRight,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.centerLeft,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.center,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.centerRight,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.bottomLeft,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.bottomCenter,
          onPressed: _changeAlignment,
        ),
        AlignmentButton(
          alignment: Alignment.bottomRight,
          onPressed: _changeAlignment,
        ),
      ],
    );
  }
}

typedef VoidCallbackAlignment = void Function(Alignment);

class AlignmentButton extends StatelessWidget {
  const AlignmentButton({
    Key? key,
    required this.alignment,
    required this.onPressed,
  }) : super(key: key);

  final Alignment alignment;
  final VoidCallbackAlignment onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: IconButton(
        icon: const Icon(Icons.control_point),
        onPressed: () {
          onPressed(alignment);
        },
      ),
    );
  }
}