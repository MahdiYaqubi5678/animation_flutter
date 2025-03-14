import 'package:flutter/material.dart';

class AnimatedCart extends StatefulWidget {
  const AnimatedCart({super.key});

  @override
  State<AnimatedCart> createState() => _AnimatedCartState();
}

// a great example for ecommerce applications

class _AnimatedCartState extends State<AnimatedCart> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Cart Button"),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            width: isExpanded ? 200 : 80,
            height: 60,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 10),
            ),
            child: Row(
              mainAxisAlignment: isExpanded
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  isExpanded ? Icons.done : Icons.shopping_cart,
                  color: Colors.white,
                ),
                AnimatedOpacity(
                  opacity: isExpanded ? 1 : 0,
                  duration: const Duration(milliseconds: 750),
                  child: Text(
                    isExpanded ? "Added to Cart" : "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
