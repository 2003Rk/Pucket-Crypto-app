

import 'package:cryptoapp/wallet/withdrawpage.dart';
import 'package:flutter/material.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Section with Card
            Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: screenHeight * 0.015,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: screenWidth * 0.105,
                          height: screenWidth * 0.105,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Confirmation',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.105),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Credit Card with Image
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/card copy.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback design if image not found
                          return Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF4A5F7F),
                                  Color(0xFF5B7396),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                // Decorative circles
                                Positioned(
                                  right: -30,
                                  top: -30,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  bottom: -40,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.03),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.05),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: screenWidth * 0.12,
                                            height: screenWidth * 0.09,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD4AF37),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.credit_card,
                                                color: const Color(0xFF4A5F7F),
                                                size: screenWidth * 0.05,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.contactless,
                                            color: Colors.white.withOpacity(0.8),
                                            size: screenWidth * 0.08,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        '2564  8546  8421  1121',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: screenWidth * 0.048,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.015),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.04,
                                          vertical: screenHeight * 0.012,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5A9B89),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tommy Jason',
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.9),
                                                    fontSize: screenWidth * 0.04,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  '13/24',
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.7),
                                                    fontSize: screenWidth * 0.03,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: screenWidth * 0.08,
                                                  height: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.3),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Transform.translate(
                                                  offset: const Offset(-10, 0),
                                                  child: Container(
                                                    width: screenWidth * 0.08,
                                                    height: screenWidth * 0.08,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white.withOpacity(0.3),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Sheet - Success Modal
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.62,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Handle bar
                    Container(
                      width: screenWidth * 0.25,
                      height: 4,
                      margin: EdgeInsets.only(top: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Success Illustration
                    Container(
                      width: screenWidth * 0.5,
                      height: screenWidth * 0.5,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Piggy bank outline
                          CustomPaint(
                            size: Size(screenWidth * 0.5, screenWidth * 0.5),
                            painter: PiggyBankPainter(),
                          ),
                          // Person with coin
                          Positioned(
                            top: 0,
                            left: screenWidth * 0.15,
                            child: Container(
                              width: screenWidth * 0.2,
                              height: screenWidth * 0.25,
                              child: Stack(
                                children: [
                                  // Head
                                  Positioned(
                                    top: 0,
                                    left: screenWidth * 0.045,
                                    child: Container(
                                      width: screenWidth * 0.1,
                                      height: screenWidth * 0.1,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF00A389),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  // Body
                                  Positioned(
                                    top: screenWidth * 0.08,
                                    left: 0,
                                    child: Container(
                                      width: screenWidth * 0.2,
                                      height: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2C3E50),
                                        borderRadius: BorderRadius.circular(screenWidth * 0.08),
                                      ),
                                    ),
                                  ),
                                  // Coin
                                  Positioned(
                                    top: screenWidth * 0.06,
                                    right: -screenWidth * 0.02,
                                    child: Container(
                                      width: screenWidth * 0.11,
                                      height: screenWidth * 0.11,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF00A389),
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '\$',
                                          style: TextStyle(
                                            color: const Color(0xFF00A389),
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Success Title
                    const Text(
                      'Top Up Success',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Text(
                        'Top up are reviewed which may result in delays or funds being frozen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Back to Home Button
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        0,
                        horizontalPadding,
                        screenHeight * 0.03,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF66BB6A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'BACK TO HOME',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PiggyBankPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Draw piggy bank body
    final bodyRect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.35,
      size.width * 0.7,
      size.height * 0.45,
    );
    canvas.drawOval(bodyRect, paint);

    // Draw coin slot
    final slotRect = Rect.fromLTWH(
      size.width * 0.4,
      size.height * 0.32,
      size.width * 0.2,
      size.height * 0.04,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(slotRect, const Radius.circular(2)),
      paint,
    );

    // Draw legs
    final legPaint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Front legs
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.75),
      Offset(size.width * 0.3, size.height * 0.88),
      legPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, size.height * 0.75),
      Offset(size.width * 0.7, size.height * 0.88),
      legPaint,
    );

    // Tail (curved line on left)
    final tailPath = Path();
    tailPath.moveTo(size.width * 0.15, size.height * 0.5);
    tailPath.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.45,
      size.width * 0.08,
      size.height * 0.55,
    );
    canvas.drawPath(tailPath, paint);

    // Snout (right side)
    final snoutPath = Path();
    snoutPath.moveTo(size.width * 0.85, size.height * 0.5);
    snoutPath.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.5,
      size.width * 0.95,
      size.height * 0.58,
    );
    canvas.drawPath(snoutPath, paint);

    // Base line
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.88),
      Offset(size.width * 0.9, size.height * 0.88),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}