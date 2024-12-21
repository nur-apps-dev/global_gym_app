import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../global widget/global_widget.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utlis/app_images.dart';
import '../../../../utlis/utils.dart';
import '../../../widgets/widgets.dart';

class GeneraleRoutineScreen1 extends StatelessWidget {
  const GeneraleRoutineScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
  final sizeW = MediaQuery.sizeOf(context).width;
    final arguments = Get.arguments as Map<String, dynamic>?; // Safely cast arguments
    final int? id = arguments?['id'];
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(text: "Generate Routine".tr,fontsize: 20.sp,),
      ),
      body: Container(
        height: Get.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child:SingleChildScrollView(
            child: Column(
              children: [
                id == null ?   const AppLogo():SizedBox(height: 20.h,),
                SizedBox(height: 12.h),
                // Removing Expanded and setting a fixed height for the body fat cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBodyfatCard(

                      title: "Current Bodyfat",
                      imageUrl: AppImages.bodyFatImg1,
                      progress: 0.6,
                    ),
                    _buildBodyfatCard(
                      title: "Bodyfat Goal",
                      imageUrl: AppImages.bodyFatImg1,
                      progress: 0.8,
                    ),
                  ],
                ),
                CustomText(text: "You can use the app for free! With limited functions Or you can become a premium user to unlock all of them".tr, maxline: 4),
                SizedBox(height: sizeH * .02),
                HeadingTwo(data: 'subscription_no_plan'.tr),
                SizedBox(height: sizeH * .01),
                Text(
                  'subscription_message'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: sizeH * .018),
                ),
                SizedBox(height: sizeH * .02),
                CustomText(text: 'subscription_feature1'.tr,maxline: 2,),
                SizedBox(height: sizeH * .01),
                CustomText(text: 'subscription_feature2'.tr,maxline: 2,),
                // Feature Highlights
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Icon(Icons.fitness_center, color: Colors.red),
                //     SizedBox(width: sizeW * .02),
                //     CustomText(text: 'subscription_feature1'.tr,maxline: 2,fontsize: 14.sp,)
                //
                //   ],
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Icon(Icons.restaurant, color: Colors.orange),
                //     SizedBox(width: sizeW * .02),
                //     Text('subscription_feature2'.tr),
                //   ],
                // ),

                // Subscription Options
                SizedBox(height: sizeH * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Monthly Package
                    Expanded(
                      child: Card(
                        color: Color(0xffC0C0C0),
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
                              CustomTextButton(text: 'subscription_join_now'.tr,color: Color(0xff3971FF), onTap: () { Get.offAllNamed(RouteNames.signInScreen); })
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: sizeW * .04),
                    // Yearly Package
                    Expanded(
                      child: Card(
                        color: Color(0xffFFD700),
                        child: Padding(
                          padding: EdgeInsets.all(sizeH * .02),
                          child: Column(
                            children: [
                              HeadingThree(data: '3 Month'.tr),
                              SizedBox(height: sizeH * .01),
                              HeadingTwo(data: '\$20.97'.tr),
                              SizedBox(height: sizeH * .01),
                              Text('subscription_yearly_discount'.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: sizeH * .016, color: Colors.black)),
                              SizedBox(height: sizeH * .02),
                              //join now button
                              CustomTextButton(text: 'subscription_join_now'.tr, onTap: () { Get.offAllNamed(RouteNames.signInScreen); },color: Color(0xff3971FF),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeH * .01),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingThree(data: "Get free Trial for 7 days".tr, color: Colors.blue),
                    SizedBox(width: sizeW * .02),
                    InkWell(
                        onTap: (){
                          Get.toNamed(RouteNames.customNavBar,preventDuplicates: false);
                        },
                        child: HeadingThree(data: "Free Trial".tr, color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500,)),
                  ],
                ),

                SizedBox(height: sizeH * .03),
                HeadingThree(data: 'subscription_member_question'.tr),
                SizedBox(height: sizeH * .01),
                Text(
                  'subscription_use_coupon'.tr,
                  style: TextStyle(fontSize: sizeH * .018, color: Colors.red),
                ),
                SizedBox(height: sizeH * .02),
                CustomTextButton(
                  text: 'subscription_use_coupon_button'.tr,
                  onTap: () {
                    Get.toNamed(RouteNames.couponScreen,preventDuplicates: false);
                  },
                ),
                SizedBox(height: 20.h,),
                id == null ?  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingThree(data: "Use the free version".tr, color: Colors.blue),
                    SizedBox(width: sizeW * .02),
                    InkWell(
                        onTap: (){
                          Get.toNamed(RouteNames.customNavBar,preventDuplicates: false);
                        },
                        child: HeadingThree(data: "skipNow".tr, color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500,)),
                  ],
                ):SizedBox.shrink(),
                SizedBox(height: 20.h,),
              ],
            ),
          )


        ),
      ),
    );
  }
}
Widget _buildBodyfatCard({
  required String title,
  required String imageUrl,
  required double progress,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.red, width: 1),
    ),
    child: SizedBox(
      width: 150.w,
      height: 250.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 8.h),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 8.h),
          Container(
            width: 100,
            color: Colors.grey[300], // Placeholder for the image
            child: Image.asset(imageUrl, fit: BoxFit.cover), // Replace with Image.network if needed
          ),
           SizedBox(height: 16.h),
          _buildProgressBar(progress),
           SizedBox(height: 8.h),
        ],
      ),
    ),
  );
}

Widget _buildProgressBar(double progress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      7,
          (index) {
        final isActive = index < (progress * 5).round();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            width: 14,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      },
    ),
  );
}
