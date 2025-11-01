

import 'package:cryptoapp/wallet/bridgepage.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  String displayAmount = '0';

  void onNumberPressed(String value) {
    setState(() {
      if (displayAmount == '0') {
        displayAmount = value;
      } else {
        displayAmount += value;
      }
    });
  }

  void onBackspacePressed() {
    setState(() {
      if (displayAmount.length > 1) {
        displayAmount = displayAmount.substring(0, displayAmount.length - 1);
      } else {
        displayAmount = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Green Header Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF7CB342),
                    const Color(0xFF689F38),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Header with back button
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
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Exchange',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.11),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Amount Display Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Min Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.08),

                      // Amount
                      Text(
                        '\$$displayAmount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.08),

                      // Max Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Max',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Exchange Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // From Section
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF7931A),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '₿',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'BTC',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Swap Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.swap_vert,
                        color: Colors.grey.shade700,
                        size: 20,
                      ),
                    ),

                    // To Section
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'To',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'BCH',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8DC351),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '₿',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            // Number Pad
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNumberButton('1', screenWidth, screenHeight),
                        _buildNumberButton('2', screenWidth, screenHeight),
                        _buildNumberButton('3', screenWidth, screenHeight),
                      ],
                    ),
                    // Row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNumberButton('4', screenWidth, screenHeight),
                        _buildNumberButton('5', screenWidth, screenHeight),
                        _buildNumberButton('6', screenWidth, screenHeight),
                      ],
                    ),
                    // Row 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNumberButton('7', screenWidth, screenHeight),
                        _buildNumberButton('8', screenWidth, screenHeight),
                        _buildNumberButton('9', screenWidth, screenHeight),
                      ],
                    ),
                    // Row 4
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNumberButton('*', screenWidth, screenHeight),
                        _buildNumberButton('0', screenWidth, screenHeight),
                        _buildBackspaceButton(screenWidth, screenHeight),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // Preview Convert Button
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const BridgePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5CB85C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'PREVIEW CONVERT',
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

  Widget _buildNumberButton(String number, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () => onNumberPressed(number),
      child: Container(
        width: screenWidth * 0.22,
        height: screenHeight * 0.065,
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(
            fontSize: screenWidth * 0.08,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF2C3E50),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: onBackspacePressed,
      child: Container(
        width: screenWidth * 0.22,
        height: screenHeight * 0.065,
        alignment: Alignment.center,
        child: Icon(
          Icons.backspace_outlined,
          size: screenWidth * 0.065,
          color: const Color(0xFF2C3E50),
        ),
      ),
    );
  }
}