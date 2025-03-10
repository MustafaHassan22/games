import 'package:flutter/material.dart';
import 'package:games/feature/auth/presentation/views/login_view.dart';
import 'package:lottie/lottie.dart'; // For animations (optional)

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start animation
    _controller.forward();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration:
                const Duration(milliseconds: 800), // Transition duration
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Fade transition
              // return FadeTransition(
              //   opacity: animation,
              //   child: child,
              // );

              // Slide transition (from bottom to top)
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1), // Start from bottom
                  end: Offset.zero, // End at the top
                ).animate(animation),
                child: child,
              );

              // Scale transition
              // return ScaleTransition(
              //   scale: animation,
              //   child: child,
              // );
            },
          ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(
      //     255, 253, 253, 255), // Set your desired background color
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 157, 207, 246)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // // Logo or Icon
              // ScaleTransition(
              //   scale: _animation,
              //   child: const FlutterLogo(size: 150),
              // ),

              const SizedBox(height: 20),

              // Optional: Lottie Animation
              Lottie.asset(
                'assets/animations/Z13QrnfYxr.json', // Add your Lottie file
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              // Optional: Text
              FadeTransition(
                opacity: _animation,
                child: const Text(
                  'Welcome to Games',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 150, 235),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
