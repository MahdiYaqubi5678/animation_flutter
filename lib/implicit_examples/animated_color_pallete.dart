import 'dart:math';
import 'package:flutter/material.dart';


class AnimatedColorPallete extends StatefulWidget {
  const AnimatedColorPallete({super.key});

  @override
  State<AnimatedColorPallete> createState() => _MyAppState();
}

class _MyAppState extends State<AnimatedColorPallete> {
  List<Color> currentPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Color Palette Generator"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (Color color in currentPalette)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeInToLinear,
                  width: 100,
                  height: 100,
                  color: color,
                  margin: const EdgeInsets.all(8),
                ),
              ElevatedButton(
                onPressed: regeneratePalette, 
                child: const Text("Generate New Palette"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
