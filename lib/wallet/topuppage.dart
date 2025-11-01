

import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int selectedBank = 0; // 0 = Bank of Nigeria, 1 = Bank of Canada
  int? selectedOther; // null or index of selected payment method

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.11,
                    height: screenWidth * 0.11,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Top up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.11),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.01),

                    // Bank Transfer Section
                    const Text(
                      'Bank Transfer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Bank of Nigeria Card
                    _buildBankCard(
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      bankName: 'Bank of Nigeria',
                      accountNumber: '**** **** **** 1121',
                      icon: _buildBankIcon(Colors.green.shade700, screenWidth),
                      isSelected: selectedBank == 0,
                      onTap: () {
                        setState(() {
                          selectedBank = 0;
                          selectedOther = null;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Bank of Canada Card
                    _buildBankCard(
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      bankName: 'Bank of Canada',
                      accountNumber: '**** **** **** 1564',
                      icon: _buildBankIcon(Colors.red.shade700, screenWidth),
                      isSelected: selectedBank == 1,
                      onTap: () {
                        setState(() {
                          selectedBank = 1;
                          selectedOther = null;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Other Section
                    const Text(
                      'Other',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Paypal Card
                    _buildPaymentCard(
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      title: 'Paypal',
                      subtitle: 'Easy payment',
                      icon: _buildPaypalIcon(screenWidth),
                      isSelected: selectedOther == 0,
                      onTap: () {
                        setState(() {
                          selectedOther = 0;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // PayFast Card
                    _buildPaymentCard(
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      title: 'PayFast',
                      subtitle: 'Easy payment',
                      icon: _buildPayFastIcon(screenWidth),
                      isSelected: selectedOther == 1,
                      onTap: () {
                        setState(() {
                          selectedOther = 1;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Western Union Card
                    _buildPaymentCard(
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      title: 'Western Union',
                      subtitle: 'Easy payment',
                      icon: _buildWesternUnionIcon(screenWidth),
                      isSelected: selectedOther == 2,
                      onTap: () {
                        setState(() {
                          selectedOther = 2;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5CB85C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankCard({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required String bankName,
    required String accountNumber,
    required Widget icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF5CB85C) : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    accountNumber,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF5CB85C) : Colors.grey.shade300,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF5CB85C) : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required String title,
    required String subtitle,
    required Widget icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF5CB85C) : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF5CB85C) : Colors.grey.shade300,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF5CB85C) : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankIcon(Color color, double screenWidth) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          width: screenWidth * 0.06,
          height: screenWidth * 0.05,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _buildPaypalIcon(double screenWidth) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        color: const Color(0xFF003087),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/paypal.png',
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(
                Icons.payment,
                color: Colors.white,
                size: screenWidth * 0.06,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPayFastIcon(double screenWidth) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        color: const Color(0xFF0099CC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/payfast.png',
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(
                Icons.payment,
                color: Colors.white,
                size: screenWidth * 0.06,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWesternUnionIcon(double screenWidth) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC00),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/western.png',
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(
                Icons.payment,
                color: Colors.black,
                size: screenWidth * 0.06,
              ),
            );
          },
        ),
      ),
    );
  }
}