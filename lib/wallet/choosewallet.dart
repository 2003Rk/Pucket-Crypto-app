import 'package:cryptoapp/wallet/recoveryphase.dart' show RecoveryPhraseScreen;
import 'package:flutter/material.dart';

class ChooseWalletScreen extends StatelessWidget {
  const ChooseWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              SizedBox(height: size.height * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProfileImage(size),
                      SizedBox(height: size.height * 0.03),
                      _buildTitle(isSmallScreen),
                      SizedBox(height: size.height * 0.015),
                      _buildDescription(size, isSmallScreen),
                      SizedBox(height: size.height * 0.04),
                      _buildWalletList(context, isSmallScreen),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProfileImage(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.25,
        height: size.width * 0.25,
        constraints: const BoxConstraints(
          minWidth: 80,
          maxWidth: 110,
          minHeight: 80,
          maxHeight: 110,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/dp.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade300,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey.shade500,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(bool isSmallScreen) {
    return Text(
      'Choose your wallet',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: isSmallScreen ? 22 : 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildDescription(Size size, bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Text(
        'Connect to any wallet to securely store your digital goods NFT & cryptocurrencies.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isSmallScreen ? 13 : 14,
          color: Colors.grey.shade600,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildWalletList(BuildContext context, bool isSmallScreen) {
    final wallets = [
      WalletItem(
        name: 'MetaMask',
        icon: '🦊',
        isPopular: true,
        color: const Color(0xFFFF6F00),
      ),
      WalletItem(
        name: 'CoinBase Wallet',
        icon: '⭕',
        isPopular: false,
        color: const Color(0xFF0052FF),
      ),
      WalletItem(
        name: 'WalletConnect',
        icon: '🔷',
        isPopular: false,
        color: const Color(0xFF3B99FC),
      ),
      WalletItem(
        name: 'Keplr',
        icon: '🔵',
        isPopular: false,
        color: const Color(0xFF4C6FFF),
      ),
    ];

    return Column(
      children: wallets.map((wallet) {
        return _buildWalletTile(context, wallet, isSmallScreen);
      }).toList(),
    );
  }

  Widget _buildWalletTile(BuildContext context, WalletItem wallet, bool isSmallScreen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: wallet.color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              wallet.icon,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              wallet.name,
              style: TextStyle(
                fontSize: isSmallScreen ? 15 : 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            if (wallet.isPopular) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D68F),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 10 : 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey.shade400,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecoveryPhraseScreen(),
            ),
          );
        },
      ),
    );
  }
}

class WalletItem {
  final String name;
  final String icon;
  final bool isPopular;
  final Color color;

  WalletItem({
    required this.name,
    required this.icon,
    required this.isPopular,
    required this.color,
  });
}
