import 'package:fifteen/settings/ui/ad_chance_slider.dart';
import 'package:fifteen/settings/ui/annoying_ads_enabled_checkbox.dart';
import 'package:flutter/material.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(Icons.attach_money),
          title: Text("Support the Dev"),
          children: [
            AnnoyingAdsEnabledCheckbox(),
            AdChanceSlider(),
            Text(""), // for padding
          ],
        ),
      ),
    );
  }
}
