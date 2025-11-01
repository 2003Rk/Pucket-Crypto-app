import 'package:cryptoapp/wallet/exchangescreen.dart' show TransactionsPage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuyBitcoinScreen extends StatefulWidget {
  const BuyBitcoinScreen({Key? key}) : super(key: key);

  @override
  State<BuyBitcoinScreen> createState() => _BuyBitcoinScreenState();
}

class _BuyBitcoinScreenState extends State<BuyBitcoinScreen> {
  String amount = '0';
  final double availableBalance = 10378.50;
  final double minAmount = 100;
  final double maxAmount = 10000;

  void _onNumberPressed(String number) {
    setState(() {
      if (amount == '0') {
        amount = number;
      } else {
        amount += number;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = '0';
      }
    });
  }

  void _onDecimal() {
    setState(() {
      if (!amount.contains('.')) {
        amount += '.';
      }
    });
  }

  void _setPercentage(double percentage) {
    setState(() {
      double value = availableBalance * percentage;
      if (value > maxAmount) value = maxAmount;
      if (value < minAmount) value = minAmount;
      amount = value.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 375;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            // Green Header Card
            Container(
              margin: EdgeInsets.all(size.width * 0.02),
              padding: EdgeInsets.all(size.width * 0.05),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7CB342), Color(0xFF558B2F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  // Top Row - Back Button, Title, Sell BTC Button
                  Row(
                    children: [
                      // Back Button
                      Container(
                        width: size.width * 0.11,
                        height: size.width * 0.11,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(size.width * 0.03),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: size.width * 0.05,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Buy Bitcoin',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 18 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Sell BTC Button
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.035,
                          vertical: size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'SELL BTC',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  // Enter Amount Label
                  Text(
                    'Enter Amount in \$',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  // Amount Display
                  Text(
                    '\$$amount',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 48 : 56,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  // Min/Max Text
                  Text(
                    'Min \$${minAmount.toInt()} - Max \$${maxAmount.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // Available Balance
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.012,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9800),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '₿',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$${availableBalance.toStringAsFixed(2)} Available',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.025),

            // Percentage Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPercentageButton('0%', 0.0, size),
                  _buildPercentageButton('10%', 0.1, size),
                  _buildPercentageButton('25%', 0.25, size),
                  _buildPercentageButton('50%', 0.5, size),
                  _buildPercentageButton('75%', 0.75, size),
                  _buildPercentageButton('100%', 1.0, size),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.04),

            // Number Pad
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                children: [
                  // Row 1: 1, 2, 3
                  _buildNumberRow(['1', '2', '3'], size),
                  SizedBox(height: size.height * 0.02),
                  // Row 2: 4, 5, 6
                  _buildNumberRow(['4', '5', '6'], size),
                  SizedBox(height: size.height * 0.02),
                  // Row 3: 7, 8, 9
                  _buildNumberRow(['7', '8', '9'], size),
                  SizedBox(height: size.height * 0.02),
                  // Row 4: *, 0, Backspace
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNumberButton('*', size, onTap: _onDecimal),
                      _buildNumberButton('0', size),
                      _buildBackspaceButton(size),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Submit Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionsPage(),
                            ),
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7CB342),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // Home Indicator
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

  Widget _buildPercentageButton(String label, double percentage, Size size) {
    return GestureDetector(
      onTap: () => _setPercentage(percentage),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025,
          vertical: size.height * 0.008,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildNumberRow(List<String> numbers, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: numbers.map((number) => _buildNumberButton(number, size)).toList(),
    );
  }

  Widget _buildNumberButton(String number, Size size, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => _onNumberPressed(number),
      child: Container(
        width: size.width * 0.22,
        height: size.width * 0.22,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1E3A5F),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(Size size) {
    return GestureDetector(
      onTap: _onBackspace,
      child: Container(
        width: size.width * 0.22,
        height: size.width * 0.22,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            size: 28,
            color: Color(0xFF1E3A5F),
          ),
        ),
      ),
    );
  }
}

