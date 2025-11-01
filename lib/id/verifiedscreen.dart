import 'package:cryptoapp/wallet/choosewallet.dart';
import 'package:cryptoapp/wallet/choosewallet2.dart';
import 'package:flutter/material.dart';


class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    final iconSize = size.width * 0.35;
    final innerIconSize = size.width * 0.25;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: 20,
          ),
          child: Column(
            children: [
            
              Expanded(
                child: _buildMainContent(context, size, isSmallScreen, iconSize, innerIconSize),
              ),
              _buildDoneButton(context, isSmallScreen),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    Size size,
    bool isSmallScreen,
    double iconSize,
    double innerIconSize,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildVerificationIcon(size, isSmallScreen, iconSize, innerIconSize),
        SizedBox(height: size.height * 0.06),
        _buildVerifiedTitle(isSmallScreen),
        SizedBox(height: size.height * 0.015),
        _buildDescription(size, isSmallScreen),
      ],
    );
  }

  Widget _buildVerificationIcon(
    Size size,
    bool isSmallScreen,
    double iconSize,
    double innerIconSize,
  ) {
    return SizedBox(
      width: iconSize.clamp(100, 150),
      height: iconSize.clamp(100, 150),
      child: Image.asset(
        'assets/verified.png',
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to original design if image fails to load
          return Stack(
            alignment: Alignment.center,
            children: [
              // Outer circle border
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
              ),
              // Inner green circle with checkmark
              Container(
                width: innerIconSize.clamp(80, 110),
                height: innerIconSize.clamp(80, 110),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF6FB42A),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: (size.width * 0.12).clamp(30, 50),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVerifiedTitle(bool isSmallScreen) {
    return Text(
      'Verified',
      style: TextStyle(
        fontSize: isSmallScreen ? 26 : 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildDescription(Size size, bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Text(
        'You currently have access to all of VAEX\'s features and high limits',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isSmallScreen ? 13 : 14,
          color: Colors.grey.shade500,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildDoneButton(BuildContext context, bool isSmallScreen) {
    return SizedBox(
      width: double.infinity,
      height: isSmallScreen ? 50 : 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChooseWallet2(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6FB42A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          'DONE',
          style: TextStyle(
            fontSize: isSmallScreen ? 15 : 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}