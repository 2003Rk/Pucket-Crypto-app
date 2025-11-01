import 'package:flutter/material.dart';
import 'dart:async';
import 'startpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fade animation
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start fade animation
    _animationController.forward();

    // Navigate to onboarding page after 5 seconds with fade out
    Timer(const Duration(seconds: 5), () {
      _animationController.reverse().then((_) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnboardingScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ MediaQuery values for responsive design
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Stack(
              children: [
                // ✅ Background image (responsive)
                Positioned.fill(
                  child: Image.asset(
                    'assets/linegroup.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // ✅ Center content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ Responsive logo size
                      Image.asset(
                        'assets/pucketlogo.png',
                        width: width * 0.5, // 50% of screen width
                        height: height * 0.25, // 25% of screen height
                        fit: BoxFit.contain,
                      ),

                      SizedBox(height: height * 0.03),

                    
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
