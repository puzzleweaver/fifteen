import 'dart:io';

import 'package:fifteen/main.dart';
import 'package:fifteen/shared_ui/prefs.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BannerAdWidget extends StatefulWidget {
  final AdSize adSize;
  final bool padded;
  final int adIndex;

  final String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-9631185147473049/3648411751' // android
      : 'ca-app-pub-9631185147473049/8009047333'; // ios

  BannerAdWidget(
    this.adIndex, {
    super.key,
    this.adSize = AdSize.banner,
    this.padded = false,
  });

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  double _adChance = Prefs.adChanceDefault;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
    _loadAd();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adChance = prefs.getDouble(Prefs.adChanceLabel) ?? Prefs.adChanceDefault;
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();
    if (appState.adRolls[widget.adIndex] < _adChance) {
      // DO show an ad
      if (widget.padded) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: _ad(),
        );
      } else {
        return _ad();
      }
    } else {
      // DON'T show an ad
      return Container();
    }
  }

  Widget _ad() {
    return SizedBox(
      width: widget.adSize.width.toDouble(),
      height: widget.adSize.height.toDouble(),
      child: _bannerAd == null
          ? SizedBox(child: Container()) // Container(color: Colors.red))
          : AdWidget(ad: _bannerAd!),
    );
  }

  void _loadAd() {
    final bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }
}
