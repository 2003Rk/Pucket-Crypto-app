
import 'package:cryptoapp/auth/lang.dart';
import 'package:cryptoapp/auth/updatepass.dart';
import 'package:flutter/material.dart';
import 'profiledetail.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool lightMode = false;
  int selectedIndex = 4;

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
                      child: Text(
                        'Account',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
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
                  children: [
                    SizedBox(height: height * 0.02),
                    // Profile Section
                    Row(
                      children: [
                        Container(
                          width: width * 0.16,
                          height: width * 0.16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pravatar.cc/150?img=12',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                'johndoe@gmail.com',
                                style: TextStyle(
                                  fontSize: width * 0.037,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileDetailsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 22,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    // Menu Items
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Profile',
                      onTap: () {},
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.language,
                      title: 'Language',
                      trailing: Text(
                        'English (US)',
                        style: TextStyle(
                          fontSize: width * 0.037,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LanguageScreen(),
                          ),
                        );    
                      },
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.add_circle_outline,
                      title: 'Top up',
                      onTap: () {},
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Withdraw',
                      onTap: () {},
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.wb_sunny_outlined,
                      title: 'Light',
                      trailing: Switch(
                        value: lightMode,
                        onChanged: (value) {
                          setState(() {
                            lightMode = value;
                          });
                        },
                        activeColor: const Color(0xFF7CB342),
                      ),
                      showArrow: false,
                      onTap: null,
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.info_outline,
                      title: 'Help center',
                      onTap: () {},
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.lock_outline,
                      title: '2FA Security',
                      onTap: () {},
                      width: width,
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Change Password',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdatePasswordScreen(),
                          ),
                        );  
                      },
                      width: width,
                    ),
                    SizedBox(height: height * 0.03),
                    // Logout Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  index: 0,
                  width: width,
                ),
                _buildNavItem(
                  icon: Icons.show_chart,
                  label: 'Market',
                  index: 1,
                  width: width,
                ),
                _buildNavItem(
                  icon: Icons.swap_horiz,
                  label: '',
                  index: 2,
                  width: width,
                  isCenter: true,
                ),
                _buildNavItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Transac',
                  index: 3,
                  width: width,
                ),
                _buildNavItem(
                  icon: Icons.person_outline,
                  label: 'Account',
                  index: 4,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    bool showArrow = true,
    required double width,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.grey.shade700,
            ),
            SizedBox(width: width * 0.04),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black87,
                ),
              ),
            ),
            if (trailing != null) trailing,
            if (showArrow && trailing == null)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required double width,
    bool isCenter = false,
  }) {
    final isSelected = selectedIndex == index;

    if (isCenter) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          width: width * 0.15,
          height: width * 0.15,
        
          child: ClipOval(
            child: Image.asset(
              'assets/Scan QR.png',
              width: width * 0.08,
              height: width * 0.08,
              fit: BoxFit.cover,
            
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                );
              },
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF7CB342) : Colors.grey.shade600,
            size: 26,
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: width * 0.03,
                color: isSelected ? const Color(0xFF7CB342) : Colors.grey.shade600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}