import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  late Color color = Colors.blue;
  late double borderRadius = 150.0;
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    borderRadius = 150.0;
  }

  void _animation() {
    setState(() {
      borderRadius = clicked ? 150.0 : 0;
      clicked = !clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: GestureDetector(
            onTap: _animation,
            child: Container(
              margin: const EdgeInsets.all(40.0),
              child: AnimatedAlign(
                alignment: clicked ? Alignment.topCenter : Alignment.bottomRight,
                duration: const Duration(seconds: 2),
                curve: Curves.ease,
                child: Container(
                  width: clicked ? 150.0 : 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
