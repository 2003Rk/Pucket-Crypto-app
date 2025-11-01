

import 'package:flutter/material.dart';
import 'electricityconfirmatio.dart';

class ElectricityBillScreen extends StatefulWidget {
  const ElectricityBillScreen({Key? key}) : super(key: key);

  @override
  State<ElectricityBillScreen> createState() => _ElectricityBillScreenState();
}

class _ElectricityBillScreenState extends State<ElectricityBillScreen> {
  String? selectedProvider;
  String? selectedPackage;
  final meterController = TextEditingController(text: '0123456789');
  final amountController = TextEditingController(text: '₦0.00');

  final List<Map<String, dynamic>> recentPurchases = [
    {
      'name': 'Ikeja Electrcity',
      'number': '8063579245',
      'time': '9.25AM',
      'icon': Icons.flash_on,
      'color': const Color(0xFFFF9800),
    },
    {
      'name': 'Kano Electrcity Distribution C...',
      'number': '8063579245',
      'time': 'Yester...',
      'icon': Icons.bolt,
      'color': const Color(0xFFFF5722),
    },
    {
      'name': 'Enugu Electricity Distribution...',
      'number': '8063579245',
      'time': '8/07/23',
      'icon': Icons.electric_bolt,
      'color': const Color(0xFF2196F3),
    },
    {
      'name': 'Eko Electricity Distribution PLC',
      'number': '8063579245',
      'time': '9.25AM',
      'icon': Icons.flash_on,
      'color': const Color(0xFF9C27B0),
    },
    {
      'name': 'Jos Electricity Distribution PLC',
      'number': '8063579245',
      'time': '8/07/23',
      'icon': Icons.flash_on,
      'color': const Color(0xFFFF9800),
    },
    {
      'name': 'Benin Electricity Distribution P...',
      'number': '8063579245',
      'time': '9.25AM',
      'icon': Icons.bolt,
      'color': const Color(0xFF4CAF50),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Row(
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
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Electricity',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            width: 24,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF008751),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF008751),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.01),
                    // Balance Badge
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.012,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF9800),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '₿',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              '\$10,378.50 Available',
                              style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    // Choose Provider Dropdown
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Choose Provider',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.grey.shade600,
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
                    SizedBox(height: height * 0.02),
                    // Select Package Dropdown
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Select Package',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.grey.shade600,
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
                    SizedBox(height: height * 0.025),
                    // Meter Number
                    Text(
                      'Meter Number',
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
                        vertical: height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: meterController,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.grey.shade600,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    // Amount
                    Text(
                      'Amount',
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
                        vertical: height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: amountController,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.grey.shade600,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    // Recent Purchases
                    Text(
                      'Recent Purchases',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // Recent Purchases List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recentPurchases.length,
                      itemBuilder: (context, index) {
                        final purchase = recentPurchases[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: height * 0.015),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ElectricityConfirmationScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: purchase['color'].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  purchase['icon'],
                                  color: purchase['color'],
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      purchase['name'],
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: height * 0.005),
                                    Text(
                                      purchase['number'],
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                purchase['time'],
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}