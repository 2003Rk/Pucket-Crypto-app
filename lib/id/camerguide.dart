import 'package:cryptoapp/id/takephoto.dart';
import 'package:flutter/material.dart';

class PassportPhotoScreen extends StatelessWidget {
  const PassportPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.03),
                    
                    // Passport illustration
                    Center(
                      child: Container(
                        width: size.width * 1.0,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Passportheader.png'),
                            fit: BoxFit.contain,
                          ),
                        
                          borderRadius: BorderRadius.circular(20),
                        ),
                        
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.05),
                    
                    // Title
                    Text(
                      'Before take your passport photo, please make sure that',
                      style: TextStyle(
                        fontSize: size.width * 0.065,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.3,
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.03),
                    
                    // Instruction items
                    _buildInstructionItem(
                      text: "Your ID isn't expired",
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    _buildInstructionItem(
                      text: "Take a clear photo",
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    _buildInstructionItem(
                      text: "Capture you entire ID",
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
            
            // Take Photo button
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const  PassportScannerScreen (),
                            ),
                          );
                    print('Take photo pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6ABD45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'TAKE PHOTO',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
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

  Widget _buildInstructionItem({
    required String text,
    required Size size,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height * 0.005),
          width: size.width * 0.012,
          height: size.width * 0.012,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: size.width * 0.03),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
