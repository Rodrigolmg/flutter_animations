import 'dart:math';

import 'package:flutter/material.dart';

class AligmentGeometryTweenExample extends StatefulWidget {
  const AligmentGeometryTweenExample({Key? key}) : super(key: key);

  @override
  _AligmentGeometryTweenExampleState createState() => _AligmentGeometryTweenExampleState();
}

class _AligmentGeometryTweenExampleState extends State<AligmentGeometryTweenExample> {

  Alignment _alignment = Alignment.center;

  void _updateAlignment(){
    setState(() {
      _alignment = Alignment(Random().nextDouble(), Random().nextDouble());
    });
  }

  final String _text = 'Texto teste';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAlignment,
        child: const Icon(
          Icons.update
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TweenAnimationBuilder(
          tween: AlignmentGeometryTween(begin: Alignment.center, end: _alignment),
          duration: const Duration(milliseconds: 950),
          curve: Curves.elasticOut,
          builder: (context, align, child) {
            return Container(
              alignment: align as Alignment,
              child: child,
            );
          },
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 25
            ),
          ),
        ),
      ),
    );
  }
}
