import 'dart:async';
import 'dart:math';

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
      title: 'Implicit Animation Game',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF15202D)
      ),
      home: ImplicitAnimatedGame(),
    );
  }
}

class ImplicitAnimatedGame extends StatefulWidget {
  ImplicitAnimatedGame({Key? key,}) : super(key: key);

  @override
  _ImplicitAnimatedGameState createState() => _ImplicitAnimatedGameState();
}

class _ImplicitAnimatedGameState extends State<ImplicitAnimatedGame> {

  static final _rnd = Random();

  double _width = 100;
  double _height = 100;
  double _radius = 50;
  Color _color = Colors.red;
  Alignment _alignment = const Alignment(.5, .5);

  int _score = 0;

  void _randomize(){
    _color = Color.fromARGB(
      _rnd.nextInt(255),
      _rnd.nextInt(255),
      _rnd.nextInt(255),
      _rnd.nextInt(255)
    );

    _width = _rnd.nextDouble() * 200 + _rnd.nextInt(10);
    _height = _rnd.nextDouble() * 200 + _rnd.nextInt(10);
    _radius = _rnd.nextDouble() * 50 + _rnd.nextInt(10);

    _alignment = Alignment(
      _rnd.nextDouble() * 2 - 1,
      _rnd.nextDouble() * 2 - 1,
    );

  }

  void _increaseScore(){
    _score++;
  }

  Timer? _timer;
  int _countDown = 30;
  int _decrementator = 1;
  int _duration = 600;
  bool _isPlaying = false;

  void _startGame(){
    _score = 0;
    _countDown = 30;
    _isPlaying = true;
    _randomize();
    _startTimer();
  }

  void _endGame(){
    _isPlaying = false;
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        setState(() {
          if(_countDown < 1){
            _endGame();
            timer.cancel();
          } else {
            _countDown--;
            _decrementator++;
            if(_decrementator == 10){
              _duration = _duration - 200;
              _decrementator = 1;
            }
          }
        });
      }
    );
  }




  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Implicit Animated Game"),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Score: $_score',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  if(!_isPlaying)
                    TextButton(
                      onPressed: () => setState(_startGame),
                      child: Text(
                        "Start Game",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      )
                    )
                  else
                    Text(
                      '$_countDown',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )
                ],
              ),
            ),
            if(_isPlaying)
              GestureDetector(
                onTap: (){
                  setState(() {
                    _increaseScore();
                    _randomize();
                  });
                },
                child: AnimatedAlign(
                  duration: Duration(milliseconds: _duration),
                  curve: Curves.ease,
                  alignment: _alignment,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.bounceIn,
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.circular(_radius)
                    ),
                  ),
                ),
              )
            else Container()
          ],
        ),
      ),
    );
  }
}
