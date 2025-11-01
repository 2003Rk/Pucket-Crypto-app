
import 'package:cryptoapp/id/selectID.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                // Back button
                Container(
                  width: width * 0.12,
                  height: width * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: height * 0.04),
                // Title
                Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.015),
                // Description
                Text(
                  'To ensure the security of your account and protect against fraud, we require you to complete our identity verification process',
                  style: TextStyle(
                    fontSize: width * 0.037,
                    color: Colors.grey.shade500,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: height * 0.04),
                // Photo ID option
                _buildVerificationOptionWithImage(
                  width: width,
                  height: height,
                  imagePath: 'assets/photoid.png',
                  title: 'Photo ID',
                  description: 'ID card, passport, driver license supported',
                ),
                SizedBox(height: height * 0.02),
                // Proof of address option
               _buildVerificationOptionWithImage(
                  width: width,
                  height: height,
                  imagePath: 'assets/photoid.png',
                  title: 'Proof of address',
                  description: 'Documents like bank statement, utility bill supported',
                ),
                SizedBox(height: height * 0.02),
                // Facial recognition option
                _buildVerificationOptionWithImage(
                  width: width,
                  height: height,
                  imagePath: 'assets/facial.png',
                  title: 'Facial recognition',
                  description: 'Confirm that the portrait matches the picture on the identification document.',
                ),
                SizedBox(height: height * 0.06),
                // Terms text
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: width * 0.032,
                      color: Colors.grey.shade500,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            'Clicking the continue button means that I have read and agreed to the ',
                      ),
                      TextSpan(
                        text: 'user identity authentication information statement',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                // Agree and continue button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectIdTypeScreen(),
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
                      'Agree and continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                // Bottom indicator
                Center(
                  child: Container(
                    width: width * 0.35,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationOption({
    required double width,
    required double height,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon container
          Container(
            width: width * 0.11,
            height: width * 0.11,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: width * 0.06,
            ),
          ),
          SizedBox(width: width * 0.04),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.042,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.grey.shade500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationOptionWithImage({
    required double width,
    required double height,
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            width: width * 0.11,
            height: width * 0.11,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(width * 0.02),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: width * 0.04),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.042,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.grey.shade500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}