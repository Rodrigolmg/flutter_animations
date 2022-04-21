import 'package:flutter/material.dart';
import 'package:tween_animation_examples/tween_example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tween Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TweenExample(),
    );
  }
}

