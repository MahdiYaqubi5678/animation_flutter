import 'package:animation/implicit_examples/animated_color_pallete.dart';
import 'package:animation/implicit_examples/animated_shopping_cart_button.dart';
import 'package:animation/implicit_examples/animated_circle_glow.dart';
import 'package:animation/explicit_examples/animated_login.dart';
import 'package:animation/explicit_examples/animated_loading.dart';
import 'package:animation/page_route_animation/animated_splash.dart';
import 'package:animation/custome_painter_examples/animated_bouncing_ball.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const AnimatedColorPallete(),
      // home: const AnimatedCart(),
      // home: const AnimatedCircle(),
      // home: const AnimatedLogin(),
      // home: AnimatedLoading(progres: 1.00, color: Colors.blue.shade600),
      // home: const AnimatedSplash(),
      home: const AnimatedBouncingBall(),
    );
  }
}


