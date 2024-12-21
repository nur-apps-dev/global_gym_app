
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';

import '../../../../global widget/global_widget.dart';
import '../../../widgets/widgets.dart';

class RoutineGenerateScreen extends StatefulWidget {
  const RoutineGenerateScreen({super.key});

  @override
  State<RoutineGenerateScreen> createState() => _RoutineGenerateScreenState();
}

class _RoutineGenerateScreenState extends State<RoutineGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(text: "Generate Routine".tr,fontsize: 20.sp,),
      ),
      body: Container(
        height: Get.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              const AppLogo(),
              SizedBox(height: 12.h),
              Card(
            elevation: 8.0, // Shadow effect for the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),

            ),
            child: Column(
              children: [
                // Image Section (replace with your actual image)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title or Heading inside the card
                      SizedBox(height: 10.h),
                      Center(child: CustomText(text: "Disclaimer".tr,fontsize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
                      SizedBox(height: 10.h),
                      Divider(),

                      SizedBox(height: 10.h),
                      // Description or content inside the card
                      Text(
                        'disclaimerText'.tr,
                        style: TextStyle(fontSize: 16.sp, color:Color(0xff586260)),
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ],
            ),
          ),
              SizedBox(height: 30.h,),
              InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.generateRoutine,preventDuplicates: false);
                  },
                  child: Center(child: CustomText(text: "Tap to change".tr,))),

            ],
          ),
        ),
      ),
    );
  }
}
