import 'package:cryptoapp/id/passportconfim.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PassportScannerScreen extends StatefulWidget {
  const PassportScannerScreen({super.key});

  @override
  State<PassportScannerScreen> createState() => _PassportScannerScreenState();
}

class _PassportScannerScreenState extends State<PassportScannerScreen> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    if (_cameraController == null) return;
    setState(() {
      _isFlashOn = !_isFlashOn;
      _cameraController!.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );
    });
  }

  void _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    try {
      final image = await _cameraController!.takePicture();
      // Handle the captured image
      print('Picture saved to ${image.path}');
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview
          if (_isCameraInitialized && _cameraController != null)
            SizedBox(
              width: width,
              height: height,
              child: CameraPreview(_cameraController!),
            )
          else
            Container(
              width: width,
              height: height,
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF00D9A3),
                ),
              ),
            ),

          // Dark Overlay
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.7),
          ),

          // Top Controls
          Positioned(
            top: padding.top + 16,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                Row(
                  children: [
                    // Flash Toggle Button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: _toggleFlash,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Camera Button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: _takePicture,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Center Content
          Positioned(
            top: height * 0.15,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Title Text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Place the ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Information Page of\nPassport',
                        style: TextStyle(color: Color(0xFF00D9A3)),
                      ),
                      TextSpan(
                        text: ' in the frame',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Passport Frame
                Container(
                  width: width * 0.9,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Corner brackets
                      // Top Left
                      Positioned(
                        top: -2,
                        left: -2,
                        child: _buildCornerBracket(true, true),
                      ),
                      // Top Right
                      Positioned(
                        top: -2,
                        right: -2,
                        child: _buildCornerBracket(true, false),
                      ),
                      // Bottom Left
                      Positioned(
                        bottom: -2,
                        left: -2,
                        child: _buildCornerBracket(false, true),
                      ),
                      // Bottom Right
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: _buildCornerBracket(false, false),
                      ),

                      // Center scanning line animation
                      Center(
                        child: Container(
                          width: width * 0.8,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                const Color(0xFF00D9A3).withOpacity(0.5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Take Photo Button
          Positioned(
            bottom: padding.bottom + 40,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  _takePicture();
                  // Navigate to PassportVerificationScreen after taking photo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassportVerificationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D9A3),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'TAKE PHOTO',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerBracket(bool isTop, bool isLeft) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: CornerBracketPainter(
          isTop: isTop,
          isLeft: isLeft,
          color: const Color(0xFF00D9A3),
        ),
      ),
    );
  }
}

class CornerBracketPainter extends CustomPainter {
  final bool isTop;
  final bool isLeft;
  final Color color;

  CornerBracketPainter({
    required this.isTop,
    required this.isLeft,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    if (isTop && isLeft) {
      path.moveTo(size.width * 0.6, 0);
      path.lineTo(0, 0);
      path.lineTo(0, size.height * 0.6);
    } else if (isTop && !isLeft) {
      path.moveTo(size.width * 0.4, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.6);
    } else if (!isTop && isLeft) {
      path.moveTo(0, size.height * 0.4);
      path.lineTo(0, size.height);
      path.lineTo(size.width * 0.6, size.height);
    } else {
      path.moveTo(size.width, size.height * 0.4);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width * 0.4, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



