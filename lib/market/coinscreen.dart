import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cryptochart.dart';

class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({Key? key}) : super(key: key);

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {
  String selectedFilter = 'All Coins';

  final List<CryptoItem> cryptos = [
    CryptoItem(
      name: 'Bitcoin',
      symbol: 'BTC',
      price: '\$9600.56',
      change: '+9.77%',
      isPositive: true,
      color: Color(0xFFFF9800),
      chartPath: [20, 30, 25, 40, 35, 50, 45],
    ),
    CryptoItem(
      name: 'Ethereum',
      symbol: 'ETH',
      price: '\$9600.56',
      change: '-21.00%',
      isPositive: false,
      color: Color(0xFF5C6BC0),
      chartPath: [40, 35, 30, 35, 25, 20, 25],
    ),
    CryptoItem(
      name: 'Band Protocol',
      symbol: 'BAND',
      price: '\$9600.56',
      change: '-22.97%',
      isPositive: false,
      color: Color(0xFF5C6BC0),
      chartPath: [35, 30, 28, 25, 22, 20, 18],
    ),
    CryptoItem(
      name: 'Cardano',
      symbol: 'ADA',
      price: '\$9600.56',
      change: '+16.31%',
      isPositive: true,
      color: Color(0xFF2196F3),
      chartPath: [15, 20, 25, 30, 35, 40, 45],
    ),
    CryptoItem(
      name: 'TRON',
      symbol: 'TRX',
      price: '\$9600.56',
      change: '-16.58%',
      isPositive: false,
      color: Color(0xFFE91E63),
      chartPath: [40, 38, 35, 30, 28, 25, 22],
    ),
    CryptoItem(
      name: 'Tether',
      symbol: 'USDT',
      price: '\$9600.56',
      change: '+0.07%',
      isPositive: true,
      color: Color(0xFF26A69A),
      chartPath: [25, 26, 25, 27, 26, 28, 27],
    ),
    CryptoItem(
      name: 'Dogecoin',
      symbol: 'DOGE',
      price: '\$9600.56',
      change: '+21.00%',
      isPositive: true,
      color: Color(0xFFC7A13B),
      chartPath: [15, 25, 30, 35, 40, 45, 50],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 375;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Row(
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
                      borderRadius: BorderRadius.circular(size.width * 0.03),
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
                        'Market',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 20 : 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.12),
                ],
              ),
            ),

            // Filter Chips
            Container(
              height: size.height * 0.055,
              margin: EdgeInsets.only(bottom: size.height * 0.02),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                children: [
                  _buildFilterChip('All Coins', size),
                  SizedBox(width: size.width * 0.02),
                  _buildFilterChip('Most Trade', size),
                  SizedBox(width: size.width * 0.02),
                  _buildFilterChip('Most Lose', size),
                  SizedBox(width: size.width * 0.02),
                  _buildFilterChip('New Coin', size),
                  SizedBox(width: size.width * 0.02),
                  _buildFilterChip('Top Gainers', size),
                ],
              ),
            ),

            // Crypto List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                itemCount: cryptos.length,
                itemBuilder: (context, index) {
                  return _buildCryptoCard(cryptos[index], size);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(size),
    );
  }

  Widget _buildFilterChip(String label, Size size) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        height: size.height * 0.06 ,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.012,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF7CB342) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildCryptoCard(CryptoItem crypto, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CryptoTradingChartScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.015),
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
      child: Row(
        children: [
          // Coin Icon
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
              color: crypto.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: size.width * 0.08,
                height: size.width * 0.08,
                decoration: BoxDecoration(
                  color: crypto.color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    crypto.symbol.substring(0, 1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: size.width * 0.03),

          // Coin Name and Symbol
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crypto.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  crypto.symbol,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Mini Chart
          Expanded(
            flex: 2,
            child: SizedBox(
              height: size.height * 0.04,
              child: CustomPaint(
                painter: MiniChartPainter(
                  crypto.chartPath,
                  crypto.isPositive
                      ? Colors.green.shade400
                      : Colors.red.shade400,
                ),
              ),
            ),
          ),

          SizedBox(width: size.width * 0.03),

          // Price and Change
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                crypto.price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                crypto.change,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: crypto.isPositive
                      ? Colors.green.shade600
                      : Colors.red.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildBottomNavBar(Size size) {
    return Container(
      height: size.height * 0.08,
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home', false, size),
          _buildNavItem(Icons.bar_chart, 'Market', true, size),
          _buildNavItemCenter(size),
          _buildNavItem(Icons.swap_horiz, 'Transac', false, size),
          _buildNavItem(Icons.person_outline, 'Account', false, size),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.black : Colors.grey.shade400,
          size: size.width * 0.065,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? Colors.black : Colors.grey.shade400,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItemCenter(Size size) {
    return Container(
      width: size.width * 0.15,
      height: size.width * 0.15,
      decoration: BoxDecoration(
        color: Color(0xFF7CB342),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7CB342).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/Scan QR.png',
          width: size.width * 0.08,
          height: size.width * 0.08,
          fit: BoxFit.cover,
          
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.compare_arrows,
              color: Colors.white,
              size: size.width * 0.08,
            );
          },
        ),
      ),
    );
  }
}

class CryptoItem {
  final String name;
  final String symbol;
  final String price;
  final String change;
  final bool isPositive;
  final Color color;
  final List<double> chartPath;

  CryptoItem({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.isPositive,
    required this.color,
    required this.chartPath,
  });
}

class MiniChartPainter extends CustomPainter {
  final List<double> dataPoints;
  final Color color;

  MiniChartPainter(this.dataPoints, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final maxValue = dataPoints.reduce((a, b) => a > b ? a : b);
    final minValue = dataPoints.reduce((a, b) => a < b ? a : b);
    final range = maxValue - minValue;

    for (int i = 0; i < dataPoints.length; i++) {
      final x = (i / (dataPoints.length - 1)) * size.width;
      final normalizedValue = (dataPoints[i] - minValue) / range;
      final y = size.height - (normalizedValue * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
