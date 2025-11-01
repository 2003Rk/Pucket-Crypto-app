
import 'package:cryptoapp/wallet/withdrawsucess.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  String amount = '8,256';
  String selectedPercentage = '100%';
  final double maxAmount = 12652.00;

  void onNumberPressed(String number) {
    setState(() {
      if (amount == '0') {
        amount = number;
      } else {
        amount += number;
      }
      selectedPercentage = '';
    });
  }

  void onBackspacePressed() {
    setState(() {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = '0';
      }
      selectedPercentage = '';
    });
  }

  void onPercentageSelected(String percentage) {
    setState(() {
      selectedPercentage = percentage;
      double percent = double.parse(percentage.replaceAll('%', '')) / 100;
      double calculatedAmount = maxAmount * percent;
      amount = calculatedAmount.toStringAsFixed(0).replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.045;

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        'Withdraw',
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Bank Selection Card
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.018,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: -0.3,
                                    child: Container(
                                      width: screenWidth * 0.045,
                                      height: screenWidth * 0.015,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade700,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: 0.3,
                                    child: Container(
                                      width: screenWidth * 0.045,
                                      height: screenWidth * 0.015,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade700,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.045,
                                    height: screenWidth * 0.015,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Bank of Nigeria',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '**** **** **** 1121',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade600,
                            size: 24,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Amount Display
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ $amount',
                          style: TextStyle(
                            fontSize: screenWidth * 0.16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF2C3E50),
                            height: 1,
                          ),
                        ),
                        Container(
                          width: 3,
                          height: screenWidth * 0.12,
                          color: const Color(0xFF2C3E50),
                          margin: const EdgeInsets.only(left: 2),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // Maximum Amount Text
                    Text(
                      'Maximum \$${maxAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Percentage Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPercentageButton('25%', screenWidth, screenHeight),
                        _buildPercentageButton('50%', screenWidth, screenHeight),
                        _buildPercentageButton('75%', screenWidth, screenHeight),
                        _buildPercentageButton('100%', screenWidth, screenHeight, isSelected: true),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Withdraw Button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF66BB6A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'WITHDRAW',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Number Pad
                    Column(
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
                        SizedBox(height: screenHeight * 0.02),
                        // Row 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNumberButton('4', screenWidth, screenHeight),
                            _buildNumberButton('5', screenWidth, screenHeight),
                            _buildNumberButton('6', screenWidth, screenHeight),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Row 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNumberButton('7', screenWidth, screenHeight),
                            _buildNumberButton('8', screenWidth, screenHeight),
                            _buildNumberButton('9', screenWidth, screenHeight),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
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

                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageButton(String percentage, double screenWidth, double screenHeight,
      {bool isSelected = false}) {
    final isCurrentlySelected = selectedPercentage == percentage;
    
    return GestureDetector(
      onTap: () => onPercentageSelected(percentage),
      child: Container(
        width: screenWidth * 0.2,
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          color: isCurrentlySelected ? const Color(0xFF66BB6A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isCurrentlySelected ? const Color(0xFF66BB6A) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            percentage,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isCurrentlySelected ? Colors.white : Colors.black,
            ),
          ),
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
            fontSize: screenWidth * 0.075,
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