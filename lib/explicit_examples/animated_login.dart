import 'package:flutter/material.dart';

class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({super.key});

  @override
  State<AnimatedLogin> createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin> 
  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500),);
    logoFadeAnimation = Tween<double>(begin: 0 ,end: 1).animate(controller);
    slideAnimation = Tween(begin: const Offset(-1, 1), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeAnimation,
              child: const FlutterLogo(
                size: 100,
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          //labelText: "UserName",
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400)
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "UserName",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      const TextField(
                        decoration: InputDecoration(
                          //labelText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 180, 180, 180))
                          ),
                          fillColor: Color.fromARGB(255, 238, 238, 238),
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 158, 158, 158),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}