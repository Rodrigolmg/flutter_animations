import 'dart:math';

import 'package:flutter/material.dart';

class BorderRadiusTweenExample extends StatefulWidget {
  const BorderRadiusTweenExample({Key? key}) : super(key: key);

  @override
  _BorderRadiusTweenExampleState createState() => _BorderRadiusTweenExampleState();
}

class _BorderRadiusTweenExampleState extends State<BorderRadiusTweenExample> {

  BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(5));

  void _updateRadius(){
    setState(() {
      _borderRadius = _borders[Random().nextInt(_borders.length - 1)];
    });
  }

  final List<BorderRadius> _borders = const [
    BorderRadius.all(Radius.circular(20)),
    BorderRadius.horizontal(left: Radius.circular(25), right: Radius.circular(23)),
    BorderRadius.vertical(top: Radius.circular(23), bottom: Radius.circular(25)),
    BorderRadius.only(topLeft: Radius.circular(24)),
    BorderRadius.only(topRight: Radius.circular(27)),
    BorderRadius.only(bottomLeft: Radius.circular(29)),
    BorderRadius.only(bottomRight: Radius.circular(26)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _updateRadius,
        child: const Icon(
            Icons.update
        ),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: BorderRadiusTween(begin: BorderRadius.zero, end: _borderRadius),
          curve: Curves.easeOutQuad,
          duration: const Duration(milliseconds: 950),
          builder: (context, bRT, child) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: bRT as BorderRadius,
                border: Border.all(color: Colors.black)
              ),
              width: MediaQuery.of(context).size.width * .75,
              height: MediaQuery.of(context).size.height * .4,
            );
          },
        ),
      ),
    );
  }
}
