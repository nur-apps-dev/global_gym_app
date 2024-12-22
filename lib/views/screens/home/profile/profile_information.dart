import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global widget/global_widget.dart';
import '../../../../utlis/utils.dart';

import '../../screens.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double avatarRadius = size.width * 0.15;
    final double textFontSize = size.width * 0.04;
    final double fieldHeight = size.height * 0.07;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: HeadingTwo(data: 'Profile Information'.tr), // Translated title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              // Profile Picture
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: const AssetImage(AppImages.profile), // Replace with your image
              ),
              SizedBox(height: size.height * 0.03),

              // Profile Form Fields
              _buildProfileTextField('your_name'.tr, 'Victor', fieldHeight, textFontSize),
              _buildProfileTextField('email'.tr, 'victorthegymbro@gmail.com', fieldHeight, textFontSize),
              // _buildProfileTextField('address'.tr, '32/A village/area, city-342', fieldHeight, textFontSize),
              _buildProfileTextField('gender'.tr, 'Male', fieldHeight, textFontSize),
              _buildProfileTextField('age'.tr, '24 year', fieldHeight, textFontSize),
              _buildProfileTextField('height'.tr, '178 cm', fieldHeight, textFontSize),
              _buildProfileTextField('weight'.tr, '55 kg', fieldHeight, textFontSize),

              SizedBox(height: size.height * 0.03),

              // Edit Profile Button
              CustomTextButton(
                text: 'edit_profile'.tr,
                onTap: () {
                  Get.to(ProfileUpdate());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build text fields for profile information
  Widget _buildProfileTextField(String label, String value, double height, double textFontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: height,
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
          style: TextStyle(fontSize: textFontSize, color: Colors.black),
          controller: TextEditingController(text: value),
        ),
      ),
    );
  }
}
