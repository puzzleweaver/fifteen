import 'dart:io';
import 'dart:math';

import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  final AdSize adSize;
  final bool padded;

  final String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-9631185147473049/3648411751' // android
      : 'ca-app-pub-9631185147473049/1022248415'; // ios

  BannerAdWidget({
    super.key,
    this.adSize = AdSize.banner,
    this.padded = false,
  });

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  double adRoll = Random().nextDouble();

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) {
        if (adRoll < preferences.adChance) {
          // DO show an ad
          if (widget.padded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _ad(),
            );
          } else {
            return _ad();
          }
        } else {
          // DON'T show an ad
          return Container();
        }
      },
    );
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
