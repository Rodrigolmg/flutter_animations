import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {

  final String? title;
  final Widget? child;
  final double? fontSize;

  const DemoPage({Key? key, this.title, this.child, this.fontSize = 25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Text(
          title!,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black45
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Expanded(child: child!)
      ],
    );
  }
}