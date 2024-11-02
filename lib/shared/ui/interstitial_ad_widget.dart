// A simple app that loads an interstitial ad.
import 'dart:developer';
import 'dart:io';

import 'package:fifteen/shared/ui/preferences_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterstitialAdWidget {
  static InterstitialAd? _interstitialAd;

  static final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-9631185147473049/7793424912'
      : 'ca-app-pub-9631185147473049/8009047333';

  // call this before an ad is supposed to get shown
  static void load() async {
    // first make sure that interstitials are allowed:
    final prefs = await SharedPreferences.getInstance();
    bool annoyingAds = PreferencesData(preferences: prefs).annoyingAdsEnabled;
    if (!annoyingAds) return;

    // load the ad
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err) {
                  dispose();
                },
                onAdDismissedFullScreenContent: (ad) {
                  dispose();
                },
                onAdClicked: (ad) {});
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            log('InterstitialAd failed to load: $error');
          },
        ));
  }

  // show the ad (if it's loaded)
  static void show() {
    _interstitialAd?.show();
  }

  // dispose of the loaded ad. it's a memory leak if you don't :-)
  static void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }
}
