import 'package:cryptoapp/auth/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/auth/loginscreen.dart';

class Authscreen extends StatelessWidget {
  const Authscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              // Status bar space
              SizedBox(height: height * 0.02),

              // Spacer to push logo down
              SizedBox(height: height * 0.12),

              // Logo
              SizedBox(
                width: width * 0.4,
                height: width * 0.4,
                child: Image.asset(
                  'assets/pucketlogo.png',
                  fit: BoxFit.contain,
                ),
              ),

              // Spacer
              SizedBox(height: height * 0.08),

              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF84C718), // left color
                        Color(0xFF09791A), // right color
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                 onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // make background transparent
                      shadowColor: Colors.transparent, // remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: OutlinedButton(
                  onPressed: () {
                    
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.5,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              // Or divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.025),
                child: Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: width * 0.035,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                  ],
                ),
              ),

              // Continue with Google
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.5,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Image.network(
                    'https://www.google.com/favicon.ico',
                    width: width * 0.055,
                    height: width * 0.055,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.g_mobiledata,
                        size: width * 0.07,
                        color: Colors.blue,
                      );
                    },
                  ),
                  label: Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              // Continue with Facebook
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.5,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(
                    Icons.facebook,
                    color: const Color(0xFF1877F2),
                    size: width * 0.065,
                  ),
                  label: Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Bottom indicator
              Container(
                width: width * 0.35,
                height: 5,
                margin: EdgeInsets.only(bottom: height * 0.01),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PLetterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF8DC63F), Color(0xFFFDB913)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.12
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // Draw P shape
    path.moveTo(size.width * 0.2, size.height * 0.85);
    path.lineTo(size.width * 0.2, size.height * 0.15);
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.1,
      size.width * 0.75,
      size.height * 0.35,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width * 0.2,
      size.height * 0.5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
