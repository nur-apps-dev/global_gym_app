import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';

import '../../../../../global widget/global_widget.dart';
import '../../../../../utlis/utils.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'subscription_packages_title'.tr), // "Subscription Packages" translated

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sizeH * .02),
              Image.asset(AppImages.subscription, height: sizeH * .15),
              SizedBox(height: sizeH * .02),
              HeadingTwo(data: 'subscription_no_plan'.tr,),
              SizedBox(height: sizeH * .01),
              Text(
                'subscription_message'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: sizeH * .018),
              ),
              SizedBox(height: sizeH * .02),

              // Feature Highlights
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.fitness_center, color: Colors.red),
                  SizedBox(width: sizeW * .02),
                  Text('subscription_feature1'.tr),
                ],
              ),
              SizedBox(height: sizeH * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.restaurant, color: Colors.orange),
                  SizedBox(width: sizeW * .02),
                  Text('subscription_feature2'.tr),
                ],
              ),

              // Subscription Options
              SizedBox(height: sizeH * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Monthly Package
                  Expanded(
                    child: Card(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: EdgeInsets.all(sizeH * .02),
                        child: Column(
                          children: [
                            HeadingThree(data: 'subscription_monthly'.tr),
                            SizedBox(height: sizeH * .01),
                            HeadingTwo(data: 'subscription_monthly_price'.tr),
                            SizedBox(height: sizeH * .01),
                            Text('subscription_monthly_subtitle'.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: sizeH * .016)),
                            SizedBox(height: sizeH * .02),
                            //join now button
                            CustomTextButton(text: 'subscription_join_now'.tr, onTap: () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: sizeW * .04),
                  // Yearly Package
                  Expanded(
                    child: Card(
                      color: Colors.yellow[700],
                      child: Padding(
                        padding: EdgeInsets.all(sizeH * .02),
                        child: Column(
                          children: [
                           HeadingThree(data: 'subscription_yearly'.tr),
                            SizedBox(height: sizeH * .01),
                        HeadingTwo(data: 'subscription_yearly_price'.tr,),
                            SizedBox(height: sizeH * .01),
                            Text('subscription_yearly_discount'.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: sizeH * .016, color: Colors.black)),
                            SizedBox(height: sizeH * .02),
                            //join now button
                            CustomTextButton(text: 'subscription_join_now'.tr, onTap: () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: sizeH * .03),
            HeadingThree(data:  'subscription_member_question'.tr,),
              SizedBox(height: sizeH * .01),
              Text(
                'subscription_use_coupon'.tr,
                style: TextStyle(fontSize: sizeH * .018, color: Colors.red),
              ),
              SizedBox(height: sizeH * .02),
              CustomTextButton(
                text: 'subscription_use_coupon_button'.tr,
                onTap: () {
                  Get.toNamed(RouteNames.couponScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}