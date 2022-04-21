import 'package:flutter/material.dart';
import 'package:tween_animation_examples/pages/alignment_geometry_tween.dart';
import 'package:tween_animation_examples/pages/border_radius_tween_example.dart';
import 'package:tween_animation_examples/pages/demo_page.dart';

class TweenExample extends StatefulWidget {
  const TweenExample({Key? key}) : super(key: key);

  @override
  _TweenExampleState createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: const [
            DemoPage(
              child: AligmentGeometryTweenExample(),
              title: 'Tween Alignment Geometry Example',
              fontSize: 20,
            ),
            DemoPage(
              child: BorderRadiusTweenExample(),
              title: 'Border Radius Example',
            ),
          ],
        ),
      )
    );
  }
}
