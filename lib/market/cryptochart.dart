import 'package:cryptoapp/market/buyscreen.dart' show BuyBitcoinScreen;
import 'package:cryptoapp/market/sellscreen.dart' show Sellscreen;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class CryptoTradingChartScreen extends StatefulWidget {
  const CryptoTradingChartScreen({Key? key}) : super(key: key);

  @override
  State<CryptoTradingChartScreen> createState() =>
      _CryptoTradingChartScreenState();
}

class _CryptoTradingChartScreenState extends State<CryptoTradingChartScreen> {
  String selectedTimeframe = '1 hour';
  bool isFavorite = false;

  final List<String> timeframes = [
    '15 min',
    '1 hour',
    '4 hour',
    '1 day',
    '1 week'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final isSmallScreen = size.width < 375;

    return Scaffold(
      backgroundColor: Colors.white,
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
                  Spacer(),
                  // Currency Pair Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'ETH / USDT',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Favorite Button
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
                        isFavorite ? Icons.star : Icons.star_border,
                        size: size.width * 0.06,
                        color: isFavorite ? Colors.amber : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),

            // Price and Change
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$1,150.00',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 36 : 42,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Timeframe Dropdown
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedTimeframe,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      // Indicator Dropdown
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Indicator',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Percentage Change
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.005,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '0.89%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.green.shade600,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.09),

            // Candlestick Chart
            Expanded(
              child: Stack(
                children: [
                  // Grid lines and labels
                  Positioned.fill(
                    child: CustomPaint(
                      painter: GridPainter(),
                    ),
                  ),
                  // Candlestick chart
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: CustomPaint(
                      painter: CandlestickChartPainter(),
                      size: Size.infinite,
                    ),
                  ),
                  // Volume bars
                  Positioned(
                    bottom: 0,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: CustomPaint(
                      painter: VolumeBarsPainter(),
                      size: Size(size.width * 0.9, size.height * 0.08),
                    ),
                  ),
                ],
              ),
            ),

            // Buy/Sell Buttons
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Sellscreen(),
                    )
                    );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEF5350),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'SELL',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: Container(
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuyBitcoinScreen (),
                    ),
                  );

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF66BB6A),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'BUY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Home Indicator
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
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 1;

    // Draw horizontal grid lines
    for (int i = 0; i <= 5; i++) {
      final y = (size.height * 0.7) * i / 5;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Draw price labels
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final prices = [1200, 1175, 1150, 1125, 1100];
    for (int i = 0; i < prices.length; i++) {
      final y = (size.height * 0.7) * i / 5;
      textPainter.text = TextSpan(
        text: '${prices[i]}',
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 11,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(size.width - 40, y - 6),
      );
    }

    // Draw time labels
    final times = ['22:00', '02:00', '08:00', '13:00', '17:00'];
    for (int i = 0; i < times.length; i++) {
      final x = (size.width * 0.9) * i / 4;
      textPainter.text = TextSpan(
        text: times[i],
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 11,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x, size.height * 0.72),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CandlestickChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    final candleCount = 24;
    final candleWidth = (size.width * 0.85) / candleCount;

    for (int i = 0; i < candleCount; i++) {
      final x = i * candleWidth + candleWidth / 2;
      final isGreen = random.nextBool();
      
      final open = 150 + random.nextDouble() * 100;
      final close = open + (random.nextDouble() - 0.5) * 80;
      final high = math.max(open, close) + random.nextDouble() * 50;
      final low = math.min(open, close) - random.nextDouble() * 50;

      // Normalize to canvas height
      final chartHeight = size.height * 0.6;
      final maxPrice = 250.0;
      final minPrice = 50.0;
      
      final yHigh = chartHeight - ((high - minPrice) / (maxPrice - minPrice)) * chartHeight;
      final yLow = chartHeight - ((low - minPrice) / (maxPrice - minPrice)) * chartHeight;
      final yOpen = chartHeight - ((open - minPrice) / (maxPrice - minPrice)) * chartHeight;
      final yClose = chartHeight - ((close - minPrice) / (maxPrice - minPrice)) * chartHeight;

      final color = (close > open) ? Colors.green.shade400 : Colors.red.shade400;

      // Draw wick
      final wickPaint = Paint()
        ..color = color
        ..strokeWidth = 1;
      canvas.drawLine(Offset(x, yHigh), Offset(x, yLow), wickPaint);

      // Draw body
      final bodyPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      
      final bodyRect = Rect.fromLTRB(
        x - candleWidth * 0.3,
        math.min(yOpen, yClose),
        x + candleWidth * 0.3,
        math.max(yOpen, yClose),
      );
      canvas.drawRect(bodyRect, bodyPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class VolumeBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    final barCount = 24;
    final barWidth = size.width / barCount;

    for (int i = 0; i < barCount; i++) {
      final x = i * barWidth;
      final height = (random.nextDouble() * 0.5 + 0.3) * size.height;
      final isGreen = random.nextBool();

      final paint = Paint()
        ..color = (isGreen ? Colors.green : Colors.red).withOpacity(0.2)
        ..style = PaintingStyle.fill;

      canvas.drawRect(
        Rect.fromLTWH(x + barWidth * 0.2, size.height - height, barWidth * 0.6, height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

