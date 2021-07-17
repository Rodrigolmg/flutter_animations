import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {


  final String? label;
  final VoidCallback? onPressed;

  const DemoButton({Key? key, @required this.label, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(width: .5)
          )
        ),
        child: Text(
          label!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black
          ),
        )
      ),
    );
  }
}
