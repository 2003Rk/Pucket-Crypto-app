

import 'package:cryptoapp/id/camerguide.dart';
import 'package:flutter/material.dart';

class SelectIdTypeScreen extends StatefulWidget {
  const SelectIdTypeScreen({super.key});

  @override
  _SelectIdTypeScreenState createState() => _SelectIdTypeScreenState();
}

class _SelectIdTypeScreenState extends State<SelectIdTypeScreen> {
  String selectedCountry = 'Nigeria';
  String selectedIdType = 'Passport';

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
                    SizedBox(height: size.height * 0.02),
                    
                    // Title
                    Text(
                      'Select ID type',
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    // Description
                    Text(
                      'To ensure the security of your account and protect against fraud, we require you to complete our identity verification process',
                      style: TextStyle(
                        fontSize: size.width * 0.038,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.04),
                    
                    // Country/Region label
                    Text(
                      'Document Issuing Country/Region',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    // Country dropdown
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.018,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.08,
                            height: size.width * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '🇳🇬',
                                style: TextStyle(fontSize: size.width * 0.045),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Expanded(
                            child: Text(
                              selectedCountry,
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.04),
                    
                    // ID type label
                    Text(
                      'What method would you prefer to use?',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    // ID Card option
                    _buildIdTypeOptionWithImage(
                      context: context,
                      imagePath: 'assets/IDCARD.png',
                      label: 'ID card',
                      isSelected: selectedIdType == 'ID card',
                      onTap: () {
                        setState(() {
                          selectedIdType = 'ID card';
                        });
                      },
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    // Passport option
                    _buildIdTypeOptionWithImage(
                      context: context,
                      imagePath: 'assets/passport.png',
                      label: 'Passport',
                      isSelected: selectedIdType == 'Passport',
                      onTap: () {
                        setState(() {
                          selectedIdType = 'Passport';
                        });
                      },
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.015),
                    
                    // Driver's license option
                    _buildIdTypeOptionWithImage(
                      context: context,
                      imagePath: 'assets/DL.png',
                      label: "Driver's license",
                      isSelected: selectedIdType == "Driver's license",
                      onTap: () {
                        setState(() {
                          selectedIdType = "Driver's license";
                        });
                      },
                      size: size,
                    ),
                    
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
            
            // Continue button
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
                              builder: (context) => const  PassportPhotoScreen(),
                            ),
                          );
                    print('Selected: $selectedIdType from $selectedCountry');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6ABD45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'CONTINUE',
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



  Widget _buildIdTypeOptionWithImage({
    required BuildContext context,
    required String imagePath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Size size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF6ABD45) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.1,
              height: size.width * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(size.width * 0.02),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: size.width * 0.06,
              height: size.width * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF6ABD45) : Colors.grey.shade400,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF6ABD45) : Colors.white,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: size.width * 0.04,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

// Example usage in main.dart:
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SelectIdTypeScreen(),
//   ));
// }