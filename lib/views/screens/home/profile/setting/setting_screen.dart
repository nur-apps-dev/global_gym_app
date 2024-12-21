import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';

import '../../../../../utlis/utils.dart';



class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'setting'.tr), // Translated 'Setting'
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .008),
          child: Column(
            children: [
              SizedBox(height: sizeH*.03,),
              _buildProfileOption(
                icon: Icons.lock,
                label: 'change_password'.tr, // Translated 'Change Password'
                onTap: () {
                  Get.toNamed(RouteNames.changePassScreen);
                },
              ),
              _buildProfileOption(
                icon: Icons.language,
                label: 'change_language'.tr, // Translated 'Change Language'
                onTap: () {
                  Get.toNamed(RouteNames.languageSelectionScreen);
                },
              ),
              _buildProfileOption(
                icon: Icons.privacy_tip,
                label: 'privacy_policy'.tr, // Translated 'Privacy Policy'
                onTap: () {
                  Get.toNamed(RouteNames.privacyPolicyScreen);
                },
              ),
              _buildProfileOption(
                icon: Icons.info_outline,
                label: 'terms_of_services'.tr, // Translated 'Terms of Services'
                onTap: () {
                  Get.toNamed(RouteNames.termsScreen);
                },
              ),
              _buildProfileOption(
                icon: Icons.help_outline,
                label: 'about_us'.tr, // Translated 'About Us'
                onTap: () {
                  Get.toNamed(RouteNames.aboutScreen);
                },
              ),
            ],
          ),
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
    Color borderColor = AppColors.primaryColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
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
              Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor, size: 18.h),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
