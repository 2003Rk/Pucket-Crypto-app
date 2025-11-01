import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  int _secondsRemaining = 57;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Auto-focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 57;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onNumberPressed(String number) {
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].text.isEmpty) {
        setState(() {
          _controllers[i].text = number;
        });
        if (i < _controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        } else {
          _focusNodes[i].unfocus();
        }
        break;
      }
    }
  }

  void _onBackspace() {
    for (int i = _controllers.length - 1; i >= 0; i--) {
      if (_controllers[i].text.isNotEmpty) {
        setState(() {
          _controllers[i].text = '';
        });
        if (i > 0) {
          _focusNodes[i].requestFocus();
        }
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final isSmallScreen = size.width < 375;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),

                      // Header with Back Button and Title
                      Row(
                        children: [
                          // Back Button
                          Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                size.width * 0.03,
                              ),
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

                          Expanded(
                            child: Center(
                              child: Text(
                                'Verify OTP',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 22 : 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: size.width * 0.12),
                        ],
                      ),

                      SizedBox(height: size.height * 0.04),

                      // Description Text
                      Text(
                        'Enter your OTP which has been sent to your email and completely verify your account.',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 13 : 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                          height: 1.5,
                          letterSpacing: 0.2,
                        ),
                      ),

                      SizedBox(height: size.height * 0.04),

                      // OTP Input Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return Container(
                            width: size.width * 0.13,
                            height: size.width * 0.13,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _controllers[index].text.isNotEmpty
                                    ? Colors.black
                                    : Colors.grey.shade300,
                                width: _controllers[index].text.isNotEmpty
                                    ? 2
                                    : 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.none,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                maxLength: 1,
                                readOnly: true,
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: size.height * 0.03),

                      // Resend Code Text
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'A code has been sent to your phone',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: _secondsRemaining == 0 ? _resendCode : null,
                              child: Text(
                                'Resend in ${(_secondsRemaining ~/ 60).toString().padLeft(2, '0')}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: _secondsRemaining == 0
                                      ? Color(0xFF7ED321)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      // Confirm Button
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle confirm action
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
                            'CONFIRM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Custom iOS Keyboard
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD1D5DB),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // From Messages header
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          'From Messages',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          '123 456',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Number Pad
                  Column(
                    children: [
                      // Row 1: 1, 2, 3
                      Row(
                        children: [
                          _buildKeyboardButton('1', '', size),
                          _buildKeyboardButton('2', 'ABC', size),
                          _buildKeyboardButton('3', 'DEF', size),
                        ],
                      ),
                      // Row 2: 4, 5, 6
                      Row(
                        children: [
                          _buildKeyboardButton('4', 'GHI', size),
                          _buildKeyboardButton('5', 'JKL', size),
                          _buildKeyboardButton('6', 'MNO', size),
                        ],
                      ),
                      // Row 3: 7, 8, 9
                      Row(
                        children: [
                          _buildKeyboardButton('7', 'PQRS', size),
                          _buildKeyboardButton('8', 'TUV', size),
                          _buildKeyboardButton('9', 'WXYZ', size),
                        ],
                      ),
                      // Row 4: 0, Backspace
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          _buildKeyboardButton('0', '', size),
                          _buildBackspaceButton(size),
                        ],
                      ),
                    ],
                  ),

                  // Home Indicator
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String number, String letters, Size size) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () => _onNumberPressed(number),
          child: Container(
            height: size.height * 0.065,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                if (letters.isNotEmpty)
                  Text(
                    letters,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(Size size) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: _onBackspace,
          child: Container(
            height: size.height * 0.065,
            decoration: BoxDecoration(
              color: Color(0xFFADB5BD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.backspace_outlined,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

