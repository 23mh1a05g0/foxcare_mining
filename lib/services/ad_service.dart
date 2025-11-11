import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'foxc_service.dart';

class AdService {
  static String get rewardedAdUnitId =>
      "ca-app-pub-3940256099942544/5224354917"; // test ID

  static Future<void> applyPassiveBoost(
    BuildContext context, {
    required int boostNumber,
    required VoidCallback onSuccess,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        backgroundColor: Color(0xFF5D755F),
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text("Loading Ad...", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );

    await RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          Navigator.pop(context);
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (_) => ad.dispose(),
            onAdFailedToShowFullScreenContent: (_, __) => ad.dispose(),
          );

          ad.show(onUserEarnedReward: (_, __) async {
            await FoxcService.setPassiveBoost(boostNumber, true);
            onSuccess();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Boost $boostNumber activated successfully")),
            );
            ad.dispose();
          });
        },
        onAdFailedToLoad: (_) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to load ad")),
          );
        },
      ),
    );
  }
}
