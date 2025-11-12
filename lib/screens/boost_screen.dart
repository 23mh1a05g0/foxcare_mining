import 'package:flutter/material.dart';

class BoostScreen extends StatelessWidget {
  const BoostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double greenHeight = height * 0.4;
    final double bigCircleSize = 150;
    final double smallCircleSize = 50;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Green + white background
          Column(
            children: [
              Container(
                height: greenHeight,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5DAE79),
                      Color(0xFF7EC894),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: width,
                ),
              ),
            ],
          ),

          // Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.menu,
                          color: Colors.white, size: 28),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/fox.png', height: 25),
                        const SizedBox(width: 5),
                        const Text(
                          "2 070,89 FVC (51,77 €)",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.person, color: Colors.white, size: 28),
                  ],
                ),
              ),
            ),
          ),

          // Middle large circle
          Positioned(
            top: greenHeight - 80,
            left: (width - bigCircleSize) / 2,
            child: Container(
              height: bigCircleSize,
              width: bigCircleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF7EC894),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: const Offset(0, 5),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/fox_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // --- Small Gray Containers ---
          Positioned(
            top: greenHeight - 80 - 60,
            left: (width - bigCircleSize) / 2 - 40,
            child: smallDot(context, icon: Icons.account_balance_wallet),
          ),
          Positioned(
            top: greenHeight - 80 - 90,
            left: (width - 30) / 2,
            child: smallDot(context, icon: Icons.handshake),
          ),
          Positioned(
            top: greenHeight - 80 - 60,
            left: (width + bigCircleSize) / 2 + 10,
            child: smallDot(context, icon: Icons.pets),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize / 2 - 15,
            left: (width - bigCircleSize) / 2 - 90,
            child: smallDot(context, icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize / 2 - 15,
            left: (width + bigCircleSize) / 2 + 45,
            child: smallDot(context, icon: Icons.flash_on),
          ),

          // --- Small Green Containers ---
          Positioned(
            top: greenHeight - 120 + bigCircleSize - 10,
            left: (width - bigCircleSize) / 2 - 25,
            child: smallDotGreen(context, icon: Icons.lock),
          ),
          Positioned(
            top: greenHeight - 80 + bigCircleSize - 10,
            left: (width - smallCircleSize) / 2,
            child: smallDotGreen(context, icon: Icons.handyman),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize - 10,
            left: (width + bigCircleSize) / 2 - 35,
            child: smallDotGreen(context, icon: Icons.diamond),
          ),

          // --- Green Containers on white section ---
          Positioned(
            top: greenHeight + 200,
            left: (width - bigCircleSize) / 2 - 60,
            child: smallDotGreen(context, icon: Icons.energy_savings_leaf),
          ),
          Positioned(
            top: greenHeight + 295,
            left: (width - bigCircleSize) / 2 + bigCircleSize + 0,
            child: smallDotGreen(context, icon: Icons.lock),
          ),
          Positioned(
            top: greenHeight + 190,
            left: (width - bigCircleSize) / 2 + bigCircleSize + 0,
            child: smallDotGreen(context, icon: Icons.energy_savings_leaf),
          ),
          Positioned(
            top: greenHeight + 200,
            left: (width - 80) / 2,
            child: smallDotGreen(context, icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight + 290,
            left: (width - bigCircleSize) / 2 - 50,
            child: smallDotGreen(context, icon: Icons.wallet_giftcard),
          ),
          Positioned(
            top: greenHeight + 280,
            left: (width + bigCircleSize) / 2 - 100,
            child: smallDotGreen(context, icon: Icons.flash_on),
          ),
          Positioned(
            top: greenHeight - 0 + bigCircleSize / 1 - 15,
            left: (width - bigCircleSize) / 2 - 30,
            child: smallDot(context, icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight - 0 + bigCircleSize / 1 - 15,
            left: (width + bigCircleSize) / 2 + 45,
            child: smallDot(context, icon: Icons.flash_on),
          ),

          // --- Bottom Trapezium Buttons ---
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                CustomPaint(
                  painter: TrapeziumPainter(color: const Color(0xFF5DAE79)),
                  child: SizedBox(
                    height: 70,
                    width: 130,
                    child: Center(
                      child: Image.asset('assets/fox.png',
                          height: 35, width: 35),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomPaint(
                  painter: TrapeziumPainter(color: const Color(0xFF5DAE79)),
                  child: const SizedBox(
                    height: 70,
                    width: 130,
                    child: Center(
                      child: Icon(Icons.lock, color: Colors.white, size: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Rabbit ---
          Positioned(
            bottom: 20,
            right: 20,
            child: Image.asset(
              'assets/rabbit.png',
              height: 130,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }

  // Tap-enabled gray circle
  Widget smallDot(BuildContext context, {required IconData icon}) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(icon: icon)),
      ),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 239, 238),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, color: const Color(0xFF5DAE79), size: 30),
        ),
      ),
    );
  }

  // Tap-enabled green circle
  Widget smallDotGreen(BuildContext context, {required IconData icon}) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(icon: icon)),
      ),
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF5DAE79),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, color: Colors.white, size: 35),
        ),
      ),
    );
  }
}

// --- Trapezium Painter ---
class TrapeziumPainter extends CustomPainter {
  final Color color;
  TrapeziumPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- Detail Screen ---
class DetailScreen extends StatelessWidget {
  final IconData icon;
  const DetailScreen({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: const Color(0xFF5DAE79),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF5DAE79), size: 100),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Go Back"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5DAE79),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
