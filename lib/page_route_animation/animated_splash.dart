import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> 
  with SingleTickerProviderStateMixin{
    late AnimationController controller;
    late Animation<double>scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(
          MyCostumeRouteTransition(
            route: const Destination(), 
          ),
        );
        Timer(
          const Duration(milliseconds: 500), 
          () {
            controller.reset();
          },
        );
      }
    });

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: AppBar(
        title: const Center(
          child: Text("Go Back"),
        ),
      ),
    );
  }
}

class MyCostumeRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCostumeRouteTransition({required this.route})
      : super(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );
          return SlideTransition(
            position: tween,
            child: child,
          );
        },
      );
}