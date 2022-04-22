import 'package:flutter/material.dart';

class ProxyAnimationExample extends StatefulWidget {
  const ProxyAnimationExample({Key? key}) : super(key: key);

  @override
  _ProxyAnimationExampleState createState() => _ProxyAnimationExampleState();
}

class _ProxyAnimationExampleState extends State<ProxyAnimationExample> with SingleTickerProviderStateMixin{

  late ProxyAnimation _proxyAnimation;
  late AnimationController _aController;
  final Animatable<double> _opacityTween = Tween<double>(begin: .0, end: 1.0);
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    _aController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850)
    );

    _curvedAnimation = CurvedAnimation(parent: _aController, curve: Curves.easeInQuad, reverseCurve: Curves.easeOutQuad);
    _proxyAnimation = ProxyAnimation(_curvedAnimation);
    _proxyAnimation.addListener(_updateState);
    _aController.repeat(reverse: true);
    super.initState();
  }

  void _updateState(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(_opacityTween.evaluate(_proxyAnimation)),
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      )
    );
  }
}
