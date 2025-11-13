// import 'package:flutter/material.dart';
// import '../utils/responsive.dart';
// import '../services/ad_service.dart';
// import 'boost_screen.dart'; // 👈 navigation target page

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = false;
//   bool activeBoost1Used = false;
//   bool activeBoost2Used = false;

//   Future<void> _handleBoost(int boostNumber) async {
//     setState(() => isLoading = true);
//     await AdService.applyPassiveBoost(
//       context,
//       boostNumber: boostNumber,
//       onSuccess: () {
//         setState(() {
//           if (boostNumber == 1) activeBoost1Used = true;
//           if (boostNumber == 2) activeBoost2Used = true;
//         });
//       },
//     );
//     setState(() => isLoading = false);
//   }

//   void _navigateToBoostPage() {
//     Navigator.of(context).push(
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 500),
//         pageBuilder: (context, animation, secondaryAnimation) =>
//             const BoostScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           final tween = Tween(begin: 0.0, end: 1.0);
//           return FadeTransition(opacity: animation.drive(tween), child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double logoSize = MediaQuery.of(context).size.width * 0.55;

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // 🔹 Background
//           Image.asset('assets/Main_Background.png', fit: BoxFit.cover),

//           SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // 🔹 Top bar
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 10,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.account_balance_wallet,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           const SizedBox(width: 25),
//                           Image.asset('assets/fox.png', height: 25),
//                           const SizedBox(width: 10),
//                           const Text(
//                             "2 070,89 FVC (51,77 €)",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Icon(Icons.pets, color: Colors.white, size: 30),
//                     ],
//                   ),
//                 ),

//                 // 🔹 Top Boost Row (navigates to another page)
//                 GestureDetector(
//                   onTap: _navigateToBoostPage,
//                   child: _buildBoostButton('Boost +0%  |  Boost +50%'),
//                 ),

//                 // 🔹 Center Section
//                 Column(
//                   children: [
//                     SizedBox(
//                       width: logoSize,
//                       height: logoSize,
//                       child: Image.asset(
//                         'assets/fox_logo.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     _buildMainButton('Lancer le Minage', onTap: () {}),
//                     const SizedBox(height: 25),

//                     // 🔹 Bottom Active Boosts
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _buildBoostButton(
//                           activeBoost1Used
//                               ? 'Boost 20% (Used)'
//                               : 'Boost 20% actif',
//                           onTap: activeBoost1Used
//                               ? null
//                               : () => _handleBoost(1),
//                           used: activeBoost1Used,
//                         ),
//                         const SizedBox(width: 12),
//                         _buildBoostButton(
//                           activeBoost2Used
//                               ? 'Boost 30% (Used)'
//                               : 'Boost 30% actif',
//                           onTap: activeBoost2Used
//                               ? null
//                               : () => _handleBoost(2),
//                           used: activeBoost2Used,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 // 🔹 Nodule Row (Replaced with images)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       _NoduleImage(
//                         label: 'Nodule 1',
//                         imagePath: 'assets/leaf.png',
//                       ),
//                       SizedBox(width: 55),
//                       _NoduleImage(
//                         label: 'Nodule 2',
//                         imagePath: 'assets/leaf.png',
//                       ),
//                       SizedBox(width: 55),
//                       _NoduleImage(
//                         label: 'Nodule 3',
//                         imagePath: 'assets/leaf.png',
//                       ),
//                     ],
//                   ),
//                 ),

//                 // 🔹 Bottom Navigation Row
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 12,
//                   ),
//                   margin: const EdgeInsets.only(bottom: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Icon(Icons.pets, color: Colors.white, size: 28),
//                       const Icon(
//                         Icons.grid_view,
//                         color: Colors.white,
//                         size: 28,
//                       ),

//                       // 🐰 Rabbit Image in white circle
//                       Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: const BoxDecoration(
//                           color: Colors.white70,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(
//                           'assets/rabbit.png',
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),

//                       const Icon(
//                         Icons.emoji_events,
//                         color: Colors.white,
//                         size: 28,
//                       ),

//                       // ⚡ Flash Icon in white circle (Green)
//                       Container(
//                         padding: const EdgeInsets.all(3),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color.fromARGB(
//                                 255,
//                                 216,
//                                 216,
//                                 208,
//                               ).withOpacity(0.8), // glow color
//                               spreadRadius: 8, // how far the glow spreads
//                               blurRadius: 20, // how soft the glow looks
//                             ),
//                           ],
//                         ),
//                         child: const Icon(
//                           Icons.flash_on,
//                           color: Color.fromARGB(255, 49, 137, 52),
//                           size: 25,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 🔹 Loading Overlay
//           if (isLoading)
//             Container(
//               color: Colors.black54,
//               child: const Center(
//                 child: CircularProgressIndicator(color: Colors.white),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   // 🔹 Boost Button Widget
//   Widget _buildBoostButton(
//     String text, {
//     VoidCallback? onTap,
//     bool used = false,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//         decoration: BoxDecoration(
//           color: used
//               ? Colors.grey.withOpacity(0.4)
//               : Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(color: used ? Colors.grey : Colors.white30),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Color.fromARGB(255, 2, 31, 2),
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔹 Main Action Button (Hammer icon + green text)
//   Widget _buildMainButton(String text, {required VoidCallback onTap}) {
//     return ElevatedButton.icon(
//       onPressed: onTap,
//       icon: const Icon(
//         Icons.construction,
//         color: Color.fromARGB(255, 60, 123, 62),
//       ),
//       label: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//           color: Color.fromARGB(255, 60, 123, 62),
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
//       ),
//     );
//   }
// }

// // 🔹 Nodule Display using Image (Leaf)
// class _NoduleImage extends StatelessWidget {
//   final String label;
//   final String imagePath;

//   const _NoduleImage({required this.label, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(imagePath, width: 55, height: 55, fit: BoxFit.contain),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
//       ],
//     );
//   }
// }
