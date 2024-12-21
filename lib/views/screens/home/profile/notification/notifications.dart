import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utlis/utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('notification_title'.tr), // "Notification" translated
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: sizeW * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'notification_time'.tr, // "1 Hour Ago" translated
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: sizeH * .01),
                Card(
                  color: AppColors.primaryColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none,
                        size: sizeH * .03,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: Text(
                      'notification_offer_title'.tr, // "Today’s Special Offers" translated
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'notification_offer_subtitle'.tr, // "Customers will get a special promo today." translated
                      style: TextStyle(color: Colors.white, fontSize: sizeH * .016),
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
