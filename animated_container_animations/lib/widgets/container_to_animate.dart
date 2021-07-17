import 'package:animated_container_animations/styles.dart';
import 'package:flutter/material.dart';


class ContainerToAnimate extends StatelessWidget {

  final Color? color;

  const ContainerToAnimate({Key? key, this.color = darkBlue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 200,
      height: 200,
      child: const Center(
        child: Text(
          'Change to anything you want',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
