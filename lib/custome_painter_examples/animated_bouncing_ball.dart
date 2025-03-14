import 'package:flutter/material.dart';

class AnimatedBouncingBall extends StatefulWidget {
  const AnimatedBouncingBall({super.key});

  @override
  State<AnimatedBouncingBall> createState() => _AnimatedBouncingBallState();
}

class _AnimatedBouncingBallState extends State<AnimatedBouncingBall> 
  with SingleTickerProviderStateMixin{
    late AnimationController controller;
    late Animation<double> animation;

  @override
    void initState() {
      super.initState();
      controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
      animation = Tween<double>(begin: 0, end: 1).animate(controller);

      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
      
      controller.forward();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => CustomPaint(
                size: const Size(200, 200),
                painter: BouncingBallPainter(animation.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  BouncingBallPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width, size.height - (size.height * animationValue)), 
      20, 
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}