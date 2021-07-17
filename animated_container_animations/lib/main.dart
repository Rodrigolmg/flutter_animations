import 'package:animated_container_animations/pages/container_example.dart';
import 'package:animated_container_animations/pages/crossfade_example.dart';
import 'package:animated_container_animations/pages/demo_page.dart';
import 'package:animated_container_animations/pages/opacity_example.dart';
import 'package:animated_container_animations/pages/physical_model_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
        )
      ),
      home: MyHomePage(title: 'Implicit animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            DemoPage(title: 'Container', child: ContainerExample(),),
            DemoPage(title: 'Cross Fade animation', child: CrossFadeExample()),
            DemoPage(title: 'Physical Model animation', child: PhysicalModelExample()),
            DemoPage(title: 'Opacity animation', child: OpacityExample()),
          ],
        )
      ),
    );
  }
}
