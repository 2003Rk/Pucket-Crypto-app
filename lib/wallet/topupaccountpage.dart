
import 'package:cryptoapp/wallet/confirmationpage.dart';
import 'package:flutter/material.dart';

class TopUpAmountPage extends StatefulWidget {
  const TopUpAmountPage({Key? key}) : super(key: key);

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  String amount = '2,256';
  String selectedPreset = '';

  void onNumberPressed(String number) {
    setState(() {
      if (amount == '0') {
        amount = number;
      } else {
        amount += number;
      }
      selectedPreset = '';
    });
  }

  void onBackspacePressed() {
    setState(() {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = '0';
      }
      selectedPreset = '';
    });
  }

  void onPresetSelected(String preset) {
    setState(() {
      selectedPreset = preset;
      amount = preset.replaceAll('\$', '').replaceAll(',', '');
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
                        'Top up',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Debit Card Section
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
                            width: screenWidth * 0.11,
                            height: screenWidth * 0.07,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E3A5F),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 4,
                                  left: 4,
                                  child: Container(
                                    width: 8,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFD700),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          const Text(
                            'Debit',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '\$11,510.00',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Amount Input Section
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enter amount:',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Top up fee \$3.0',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      'USD',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Text(
                                amount,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 32,
                                color: Colors.black,
                                margin: const EdgeInsets.only(left: 2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Preset Amount Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPresetButton(
                          '\$1500.00',
                          screenWidth,
                          screenHeight,
                        ),
                        _buildPresetButton(
                          '\$3000.00',
                          screenWidth,
                          screenHeight,
                        ),
                        _buildPresetButton(
                          '\$6000.00',
                          screenWidth,
                          screenHeight,
                          isSelected: true,
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmationPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF66BB6A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'CONFIRM',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

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

  Widget _buildPresetButton(String amount, double screenWidth, double screenHeight,
      {bool isSelected = false}) {
    return GestureDetector(
      onTap: () => onPresetSelected(amount),
      child: Container(
        width: screenWidth * 0.28,
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF66BB6A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF66BB6A) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
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