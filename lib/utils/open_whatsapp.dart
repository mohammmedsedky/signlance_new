import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils.dart';

class LinkLauncher {
  void openWhatsapp(String? phone) async {
    if (phone != null && phone != "") {
      bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
      if (whatsapp) {
        await FlutterLaunch.launchWhatsapp(phone: phone, message: "");
      } else {
        await launchUrl(Uri.parse("https://web.whatsapp.com/"), mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> openLink(BuildContext context, String? path) async {
    Uri url = Uri.parse('$path');
    await canLaunchUrl(url)
        ? await launchUrl(url, mode: LaunchMode.externalApplication)
        : showToast(context: context, message: "توجد مشكلة");
  }

  Future<void> makeCall(BuildContext context, String phoneNumber) async {
    // await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    String url = "tel://$phoneNumber";
    Uri urlUri = Uri.parse(url);
    await canLaunchUrl(urlUri)
        ? await launchUrl(urlUri, mode: LaunchMode.externalApplication)
        : showToast(context: context, message: "توجد مشكلة");
  }
}
