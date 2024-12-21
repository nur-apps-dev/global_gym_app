import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';

import '../../../../../global widget/global_widget.dart';
import '../../../../../utlis/utils.dart';


class MySubscriptionAfterBuy extends StatelessWidget {
  const MySubscriptionAfterBuy({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text('subscription_title'.tr), // "My Subscription" translated
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .016),
          child: Column(
            children: [
              SizedBox(height: sizeH * .02),
              Image(
                image: const AssetImage(AppImages.subscription),
                height: sizeH * .3,
              ),
              SizedBox(height: sizeH * .02),
              Text(
                'subscription_plan_message'.tr, // "You’re subscribed to the BASIC plan" translated
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: sizeH * .016),
              Text(
                'subscription_plan_expiry'.tr, // "Plan is active until 30th October, 2024" translated
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(height: sizeH * .25),
              CustomTextButton(
                text: 'subscription_see_packages'.tr, // "See Packages" translated
                onTap: () {
                   Get.toNamed(RouteNames.packageScreen);
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomTextButton(
                text: 'subscription_back_home'.tr, // "Back to Home" translated
                onTap: () {
                  Get.offAllNamed(RouteNames.customNavBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
