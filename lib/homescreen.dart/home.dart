import 'package:cryptoapp/market/buyscreen.dart';
import 'package:cryptoapp/market/coinscreen.dart' show CryptoMarketScreen;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CryptoWalletHomeScreen extends StatefulWidget {
  const CryptoWalletHomeScreen({Key? key}) : super(key: key);

  @override
  State<CryptoWalletHomeScreen> createState() => _CryptoWalletHomeScreenState();
}

class _CryptoWalletHomeScreenState extends State<CryptoWalletHomeScreen> {
  bool isWalletSelected = true;
  final TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final isSmallScreen = size.width < 375;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
                    // Top Row - Profile, Greeting, Icons
                    Row(
                      children: [
                        // Profile Image
                        CircleAvatar(
                          radius: size.width * 0.065,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=12',
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        // Greeting Text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good morning!',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 13 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 17 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Search Icon
                        Container(
                          width: size.width * 0.11,
                          height: size.width * 0.11,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: size.width * 0.06,
                            ),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        // Notification Icon
                        Container(
                          width: size.width * 0.11,
                          height: size.width * 0.11,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: size.width * 0.06,
                            ),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    // Balance Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Balance',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$17,874.39',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 26 : 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.015),

              // Wallet / Exchange Tabs
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  children: [
                    _buildTabButton(
                      'Wallet',
                      isWalletSelected,
                      () {
                        setState(() {
                          isWalletSelected = true;
                        });
                      },
                      size,
                    ),
                    SizedBox(width: size.width * 0.02),
                    _buildTabButton(
                      'Exchange',
                      !isWalletSelected,
                      () {
                        setState(() {
                          isWalletSelected = false;
                        });
                      },
                      size,
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Chat Bot Message
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                      decoration: BoxDecoration(
                        color: Color(0xFF7CB342),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/pucket.png',
                          width: size.width * 0.06,
                          height: size.width * 0.06,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.smart_toy_outlined,
                              color: Colors.white,
                              size: size.width * 0.06,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey John,',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'What you\'re looking for?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

             

              SizedBox(height: size.height * 0.02),

              // Agenda Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.08,
                          height: size.width * 0.08,
                          decoration: BoxDecoration(
                            color: Color(0xFF7CB342),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'assets/pucket.png',
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.smart_toy_outlined,
                                  color: Colors.white,
                                  size: size.width * 0.05,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.2),
                        Text(
                          'What\'s on agenda today?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    _buildAgendaItem('Daily market outlook (BTC, ETH, top altcoins trend)'),
                    _buildAgendaItem('Key support/resistance levels'),
                    _buildAgendaItem('AI-based trading signals or alerts'),
                    _buildAgendaItem('On-chain data insights (wallet flows, whale activity)'),
                    _buildAgendaItem('New token listings / exchange announcements'),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Bottom Actions
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      label: Text(
                        'Save response',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      label: Text(
                        'Clear Chat',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Chat Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: TextField(
                          controller: _chatController,
                          decoration: InputDecoration(
                            hintText: 'What can I do for you?',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Container(
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFF7CB342),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuyBitcoinScreen (),
                      ),
                    );  
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: size.width * 0.06,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(
    String text,
    bool isSelected,
    VoidCallback onTap,
    Size size,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.015,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF7CB342) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    Size size, {
    bool fullWidth = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment:
            fullWidth ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF7CB342),
            size: size.width * 0.05,
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgendaItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              height: 1.5,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
