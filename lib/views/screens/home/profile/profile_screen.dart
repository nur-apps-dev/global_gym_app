import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_button.dart';

import '../../../../routes/routes_name.dart';
import '../../../../utlis/utils.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'profile_title'.tr), // Profile title
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: sizeH * .05), // Spacing from top using screen height
            // Profile picture
            CircleAvatar(
              radius: sizeH * .06,
              backgroundImage: const AssetImage(AppImages.profile),
            ),
            SizedBox(height: sizeH * .02), // Spacing below the profile picture
            // Name
            HeadingTwo(data: 'profile_name'.tr), // Replace with user's name

            SizedBox(height: sizeH * .016),
            const Divider(thickness: 1, indent: 40, endIndent: 40),
            SizedBox(height: sizeH * .02),
            // Profile buttons
            _buildProfileOption(
              icon: Icons.person_outline,
              label: 'Profile Information'.tr, // Profile Information
              onTap: () {
                Get.toNamed(RouteNames.profileInformation);
              },
            ),
            _buildProfileOption(
              icon: Icons.notifications_none_outlined,
              label: 'notification'.tr, // Settings
              onTap: () {
             Get.toNamed(RouteNames.notificationScreen);
              },
            ),
            _buildProfileOption(
              icon: Icons.subscriptions_outlined,
              label: 'subscription'.tr, // Subscription
              onTap: () {
                //Get.toNamed(RouteNames.mySubscriptionAfterBuy);
                Get.toNamed(RouteNames.generateRoutine, arguments: {'id': 234}, preventDuplicates: false);
              },
            ),
            _buildProfileOption(
              icon: Icons.settings_outlined,
              label: 'settings'.tr, // Settings
              onTap: () {
                Get.toNamed(RouteNames.settingScreen);
              },
            ),
            SizedBox(height: sizeH * .01),
            // Logout button
            _buildProfileOption(
              isTrue: true,
              icon: Icons.logout,
              label: 'logout'.tr, // Logout
              iconColor: Colors.red,
              labelColor: Colors.red,
              borderColor: Colors.red,
              onTap: () {
                Get.bottomSheet(_buildLogoutBottomSheet(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the profile options
  Widget _buildProfileOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = AppColors.primaryColor,
    Color labelColor = AppColors.primaryColor,
    Color borderColor = AppColors.primaryColor,
    final bool? isTrue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 25.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Icon(icon, color: iconColor, size: 20.h),
              SizedBox(width: 20.w),
              Expanded(child: HeadingThree(data: label)),
              isTrue == true
                  ? const Icon(null)
                  : Icon(Icons.arrow_forward_ios,
                      color: AppColors.primaryColor, size: 20.h),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }

  // Build the custom logout bottom sheet
  Widget _buildLogoutBottomSheet(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return Container(
      height: sizeH * 0.3,
      padding:
          EdgeInsets.symmetric(vertical: sizeH * .02, horizontal: sizeW * .035),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(
              data: 'logout_confirmation'.tr,
              color: Colors.black), // Are you sure you want to
          HeadingTwo(data: 'logout_question'.tr, color: Colors.red), // logout?
          SizedBox(height: sizeH * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: CustomTextButton(
                text: 'cancel'.tr,
                onTap: () {
                  Get.back();
                },
                color: Colors.green,
              )),
              SizedBox(width: sizeW * .03),
              Expanded(
                  child: CustomTextButton(
                      text: 'logout'.tr,
                      onTap: () {
                        Get.offAllNamed(RouteNames.signInScreen);
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
