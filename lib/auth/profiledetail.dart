

import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final firstNameController = TextEditingController(text: 'John');
  final lastNameController = TextEditingController(text: 'Doe');
  final addressController = TextEditingController(text: 'abc.......');
  final cityController = TextEditingController(text: 'Madrid');
  final countryController = TextEditingController(text: 'Spain');
  final nationalityController = TextEditingController(text: 'Spain');
  final phoneController = TextEditingController(text: '958-000666');
  final dobController = TextEditingController(text: '2000-12-17');
  final genderController = TextEditingController(text: 'Male');
  
  String selectedCountryCode = '+34';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    'Profile Details',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    // Profile Avatar
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFFE4E4),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'https://i.pravatar.cc/150?img=12',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Color(0xFF1E3A5F),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    // Form Fields
                    _buildTextField(
                      label: 'First Name',
                      controller: firstNameController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'Last Name',
                      controller: lastNameController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'Address',
                      controller: addressController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'City',
                      controller: cityController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'Country',
                      controller: countryController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'Nationality',
                      controller: nationalityController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.02),
                    // Mobile Number with Country Code
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedCountryCode,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                            items: ['+34', '+1', '+44', '+91']
                                .map((code) => DropdownMenuItem(
                                      value: code,
                                      child: Text(
                                        code,
                                        style: TextStyle(
                                          fontSize: width * 0.04,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountryCode = value!;
                              });
                            },
                          ),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // Date of Birth
                    Text(
                      'Date of birth',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                            color: Colors.black54,
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: TextField(
                              controller: dobController,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    _buildTextField(
                      label: 'Gender',
                      controller: genderController,
                      width: width,
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
            // Bottom Indicator
            Container(
              width: width * 0.35,
              height: 5,
              margin: EdgeInsets.only(bottom: padding.bottom > 0 ? padding.bottom : 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required double width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: width * 0.02),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: width * 0.04,
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}