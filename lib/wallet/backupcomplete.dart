import 'package:cryptoapp/homescreen.dart/home.dart';
import 'package:cryptoapp/id/verificationscreen.dart';
import 'package:cryptoapp/main.dart';
import 'package:flutter/material.dart';

class BackupCompleteScreen extends StatelessWidget {
  const BackupCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final isSmallScreen = size.width < 375;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: padding.top + 10,
          ),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: size.width * 0.05,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              
              // Spacer to push content to center
              Spacer(flex: 2),
              
              // Success Icon
              Container(
                width: size.width * 0.18,
                height: size.width * 0.18,
                decoration: BoxDecoration(
                  color: Color(0xFF7ED321),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: const Color.fromARGB(255, 46, 44, 44),
                  size: size.width * 0.1,
                ),
              ),
              
              SizedBox(height: size.height * 0.04),
              
              // Title
              Text(
                'Your Backup Is Complete',
                style: TextStyle(
                  fontSize: isSmallScreen ? 22 : 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: size.height * 0.02),
              
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Text(
                  'You should now have your recovery phrase and password written down for future reference.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // Spacer to push button to bottom
              Spacer(flex: 3),
              
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CryptoWalletHomeScreen (),
                    ),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7ED321),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: size.height * 0.02),
              
              // Home Indicator (iOS style)
              Center(
                child: Container(
                  width: size.width * 0.35,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}

