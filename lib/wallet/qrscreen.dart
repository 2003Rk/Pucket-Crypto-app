
import 'package:cryptoapp/wallet/electricbill.dart';
import 'package:flutter/material.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

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
            SizedBox(height: height * 0.02),
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                      child: InkWell(
                        child: Text(
                          'Scan QR Code',
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),
            SizedBox(height: height * 0.1),
            // QR Code Scanner Frame
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // QR Code Container
                  Container(
                    width: width * 0.6,
                    height: width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/qr-code 3.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF1E3A5F),
                            child: const Center(
                              child: Icon(
                                Icons.qr_code_2,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Corner Brackets
                  SizedBox(
                    width: width * 0.75,
                    height: width * 0.75,
                    child: Stack(
                      children: [
                        // Top-left corner (Yellow)
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(width * 0.12, width * 0.12),
                            painter: CornerBracketPainter(
                              color: const Color(0xFFFFC107),
                              isTopLeft: true,
                            ),
                          ),
                        ),
                        // Top-right corner (Red)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CustomPaint(
                            size: Size(width * 0.12, width * 0.12),
                            painter: CornerBracketPainter(
                              color: const Color(0xFFFF5722),
                              isTopRight: true,
                            ),
                          ),
                        ),
                        // Bottom-left corner (Blue)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(width * 0.12, width * 0.12),
                            painter: CornerBracketPainter(
                              color: const Color(0xFF1E3A5F),
                              isBottomLeft: true,
                            ),
                          ),
                        ),
                        // Bottom-right corner (Green)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CustomPaint(
                            size: Size(width * 0.12, width * 0.12),
                            painter: CornerBracketPainter(
                              color: const Color(0xFF4CAF50),
                              isBottomRight: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            // Status Badge
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.015,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: width * 0.05,
                    color: Colors.black87,
                  ),
                  SizedBox(width: width * 0.02),
                  InkWell(
                    onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ElectricityBillScreen(),
                            ),
                          );
                        },
                    child: Text(
                      'Scan QR code ready',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Bottom Indicator
            Container(
              width: width * 0.35,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(height: padding.bottom > 0 ? padding.bottom : 20),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for QR Pattern
class QRPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final blockSize = size.width / 7;
    
    // Draw QR-like pattern
    final pattern = [
      [1, 1, 1, 0, 1, 1, 1],
      [1, 0, 1, 0, 1, 0, 1],
      [1, 1, 1, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 0, 0],
      [1, 1, 0, 1, 0, 1, 1],
      [1, 0, 1, 0, 1, 0, 1],
      [1, 1, 1, 0, 1, 1, 0],
    ];

    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 7; j++) {
        if (pattern[i][j] == 1) {
          canvas.drawRect(
            Rect.fromLTWH(
              j * blockSize + blockSize * 0.15,
              i * blockSize + blockSize * 0.15,
              blockSize * 0.7,
              blockSize * 0.7,
            ),
            paint,
          );
        }
      }
    }

    // Draw corner squares
    paint.strokeWidth = blockSize * 0.15;
    paint.style = PaintingStyle.stroke;

    // Top-left square
    canvas.drawRect(
      Rect.fromLTWH(blockSize * 0.3, blockSize * 0.3, blockSize * 2.4, blockSize * 2.4),
      paint,
    );
    
    // Top-right square
    canvas.drawRect(
      Rect.fromLTWH(size.width - blockSize * 2.7, blockSize * 0.3, blockSize * 2.4, blockSize * 2.4),
      paint,
    );
    
    // Bottom-left square
    canvas.drawRect(
      Rect.fromLTWH(blockSize * 0.3, size.height - blockSize * 2.7, blockSize * 2.4, blockSize * 2.4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Corner Brackets
class CornerBracketPainter extends CustomPainter {
  final Color color;
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;

  CornerBracketPainter({
    required this.color,
    this.isTopLeft = false,
    this.isTopRight = false,
    this.isBottomLeft = false,
    this.isBottomRight = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final path = Path();

    if (isTopLeft) {
      path.moveTo(size.width * 0.6, 0);
      path.lineTo(0, 0);
      path.lineTo(0, size.height * 0.6);
    } else if (isTopRight) {
      path.moveTo(size.width * 0.4, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.6);
    } else if (isBottomLeft) {
      path.moveTo(0, size.height * 0.4);
      path.lineTo(0, size.height);
      path.lineTo(size.width * 0.6, size.height);
    } else if (isBottomRight) {
      path.moveTo(size.width, size.height * 0.4);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width * 0.4, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}