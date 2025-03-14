import 'package:flutter/material.dart';

class AnimatedList extends StatefulWidget {
  const AnimatedList({super.key});

  @override
  State<AnimatedList> createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimatedList> 
  with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animations = [];
  final int itemCount = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500),);
    animations = List.generate(itemCount, (index) => Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Interval(index * (1 / itemCount), 1))),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Animated List"),
        ),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text("Hello World, Mahdi. ${index.toString()}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward(); 
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}