import 'package:flutter/material.dart';
import 'auth/authscreen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFCDE5B5),
      body: SafeArea(
        child: SingleChildScrollView( // ✅ makes it scrollable on small screens
          child: Column(
            children: [
              // Top illustration
              SizedBox(
                height: height * 0.45,
                width: width,
                child: Image.asset(
                  'assets/onboarding.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Bottom content section
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                  vertical: height * 0.11,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.1),
                    topRight: Radius.circular(width * 0.1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height * 0.02),

                    // Title
                    Text(
                      'Explore now',
                      style: TextStyle(
                        fontSize: width * 0.07, // responsive font
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'to experience the benefits',
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    // Description
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: height * 0.05),

                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Authscreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6FB81E),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.04),
                          ),
                        ),
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
