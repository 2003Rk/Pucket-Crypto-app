
import 'package:cryptoapp/wallet/recoverpahseoption.dart' show RecoveryOptionPhraseScreen;
import 'package:flutter/material.dart';

class RecoveryPhraseScreen extends StatelessWidget {
  const RecoveryPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
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
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              
              SizedBox(height: size.height * 0.05),
              
              // Title
              Text(
                'First, Let\'s Create Your\nRecovery Phrase',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.065,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
              
              SizedBox(height: size.height * 0.03),
              
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Text(
                  'A recovery phrase is a series of 12 words in a specific order. This word combination is unique to your wallet. Make sure to have pen and paper ready so you can write it down.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecoveryOptionPhraseScreen(),
                      ),
                    );  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6CB52D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: size.height * 0.02),
              
              // Bottom Indicator
              Container(
                width: size.width * 0.35,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
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