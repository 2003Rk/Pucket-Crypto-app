
import 'package:cryptoapp/id/verifiedscreen.dart' show VerifiedScreen;
import 'package:flutter/material.dart';

class PassportVerificationScreen extends StatelessWidget {
  const PassportVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
           

            // Back Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width * 0.12,
                  height: width * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: width * 0.05,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // Passport Image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                width: width * 0.9,
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/pass.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('Image loading error: $error'); // Debug print
                      return Container(
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: width * 0.12,
                              color: Colors.red.shade400,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'Image not found',
                              style: TextStyle(
                                color: Colors.red.shade600,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'passportsample.png',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: width * 0.03,
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

            SizedBox(height: height * 0.04),

            // After detected section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'After detected, you photo',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _buildCheckItem(
                    'Readable, clear and not blurry',
                    width,
                  ),
                  SizedBox(height: height * 0.015),
                  _buildCheckItem(
                    'Well-lit, not reflective, not too dark',
                    width,
                  ),
                  SizedBox(height: height * 0.015),
                  _buildCheckItem(
                    'ID occupies most of the image',
                    width,
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.04),

            // Please confirm section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please confirm that',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _buildCheckItem(
                    'ID in not expired',
                    width,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const   VerifiedScreen (),
                            ),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7CB342),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'CONFIRM',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.065,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'RETAKE',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            // Bottom Indicator
            Container(
              width: width * 0.35,
              height: height * 0.006,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(String text, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          color: Colors.grey.shade400,
          size: width * 0.05,
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: width * 0.038,
              color: Colors.grey.shade600,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}