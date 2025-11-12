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
    final double navBarHeight = 80;

    return Scaffold(
      body: Stack(
        children: [
          // Column to split screen
          Column(
            children: [
              // Top green container
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
              // Bottom white container
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: width,
                ),
              ),
            ],
          ),

          // Top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.menu, color: Colors.white, size: 28),
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

          // Big circular container
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

          // Small gray containers above the big circle
          Positioned(
            top: greenHeight - 80 - 60,
            left: (width - bigCircleSize) / 2 - 40,
            child: smallDot(icon: Icons.account_balance_wallet),
          ),
          Positioned(
            top: greenHeight - 80 - 90,
            left: (width - 30) / 2,
            child: smallDot(icon: Icons.handshake),
          ),
          Positioned(
            top: greenHeight - 80 - 60,
            left: (width + bigCircleSize) / 2 + 10,
            child: smallDot(icon: Icons.pets),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize / 2 - 15,
            left: (width - bigCircleSize) / 2 - 90,
            child: smallDot(icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize / 2 - 15,
            left: (width + bigCircleSize) / 2 + 45,
            child: smallDot(icon: Icons.flash_on),
          ),

          // Small green containers below the big circle (touch big circle)
          Positioned(
            top: greenHeight - 120 + bigCircleSize - 10,
            left: (width - bigCircleSize) / 2 - 25,
            child: smallDotGreen(icon: Icons.lock),
          ),
          Positioned(
            top: greenHeight - 80 + bigCircleSize - 10,
            left: (width - smallCircleSize) / 2,
            child: smallDotGreen(icon: Icons.handyman),
          ),
          Positioned(
            top: greenHeight - 120 + bigCircleSize - 10,
            left: (width + bigCircleSize) / 2 - 35,
            child: smallDotGreen(icon: Icons.diamond),
          ),

          // Additional small green containers on white background
          Positioned(
            top: greenHeight + 200,
            left: (width - bigCircleSize) / 2 - 60,
            child: smallDotGreen(icon: Icons.energy_savings_leaf),
          ),
          Positioned(
            top: greenHeight + 295,
            left: (width - bigCircleSize) / 2 + bigCircleSize + 0,
            child: smallDotGreen(icon: Icons.lock),
          ),
          Positioned(
            top: greenHeight + 190,
            left: (width - bigCircleSize) / 2 + bigCircleSize + 0,
            child: smallDotGreen(icon: Icons.energy_savings_leaf),
          ),
          Positioned(
            top: greenHeight + 200,
            left: (width - 80) / 2,
            child: smallDotGreen(icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight + 290,
            left: (width - bigCircleSize) / 2 - 50,
            child: smallDotGreen(icon: Icons.wallet_giftcard),
          ),
          Positioned(
            top: greenHeight + 280,
            left: (width + bigCircleSize) / 2 - 100,
            child: smallDotGreen(icon: Icons.flash_on),
          ),
          Positioned(
            top: greenHeight - 0 + bigCircleSize / 1 - 15,
            left: (width - bigCircleSize) / 2 - 30,
            child: smallDot(icon: Icons.emoji_events),
          ),
          Positioned(
            top: greenHeight - 0 + bigCircleSize / 1 - 15,
            left: (width + bigCircleSize) / 2 + 45,
            child: smallDot(icon: Icons.flash_on),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: navBarHeight,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First rectangle box with lock icon
                  navBarItem(child: const Icon(Icons.lock, color: Colors.white)),
                  // Second rectangle box with fox image
                  navBarItem(
                      child: Image.asset('assets/fox.png', height: 35, width: 35)),
                  // Third rectangle box with rabbit image
                  navBarItem(
                      child: Image.asset('assets/rabbit.png', height: 35, width: 35)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Small gray container with green icon
  Widget smallDot({required IconData icon}) {
    return Container(
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
        child: Icon(
          icon,
          color: const Color(0xFF5DAE79),
          size: 30,
        ),
      ),
    );
  }

  // Small green container with white icon
  Widget smallDotGreen({required IconData icon}) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        color: const Color(0xFF5DAE79),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  // Navigation Bar item
  Widget navBarItem({required Widget child}) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF5DAE79),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: child),
    );
  }
}
