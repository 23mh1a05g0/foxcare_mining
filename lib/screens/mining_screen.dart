import 'package:flutter/material.dart';
import '../widgets/boost.dart';
import '../widgets/content_card.dart';
import '../widgets/action_row.dart';
import '../utils/responsive.dart';
import '../services/ad_service.dart';
import '../services/foxc_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool passiveBoost1Used = false;
  bool passiveBoost2Used = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Column(
            children: [
              Boost(
                height: 160,
                child: Center(
                  child: Text(
                    'BOOST AREA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(context, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isWide ? 24 : 16),
                  child: Column(
                    children: [
                      ContentCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Passive Boosts', style: TextStyle(fontSize: s(context, 18))),
                            const SizedBox(height: 12),
                            ActionRow(
                              onBoost1: () => AdService.applyPassiveBoost(
                                context,
                                boostNumber: 1,
                                onSuccess: () => setState(() => passiveBoost1Used = true),
                              ),
                              onBoost2: () => AdService.applyPassiveBoost(
                                context,
                                boostNumber: 2,
                                onSuccess: () => setState(() => passiveBoost2Used = true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
