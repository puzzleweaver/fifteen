import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackTile extends StatelessWidget {
  const FeedbackTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.mail),
        title: const Text("Send Feedback"),
        trailing: const Icon(Icons.chevron_right),
        onTap: sendFeedback,
      ),
    );
  }

  void sendFeedback() async {
    log("sending feedback...");
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aweaver2718@gmail.com',
      queryParameters: {'subject': 'Fifteent Feedback', 'body': "I hate you."},
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch $emailUri');
    }
  }
}
