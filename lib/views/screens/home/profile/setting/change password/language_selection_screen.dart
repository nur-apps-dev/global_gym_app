import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';
import 'package:gimnasio_escorpion/utlis/app_images.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = Get.locale?.languageCode ?? 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'language_title'.tr), // "Language" translated

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingTwo(data:  'change_language'.tr),
               SizedBox(height: 20.h),
              ListTile(
                leading:  Image.asset(AppImages.english,width: 45.w,),
                title: HeadingThree(data: 'english'.tr), // "English" translated
                trailing: Radio<String>(
                  activeColor: AppColors.primaryColor,
                  value: 'en',
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                      Get.updateLocale(const Locale('en', 'US'));
                    });
                  },
                ),
              ),
              ListTile(
                leading:  Image.asset(AppImages.spanish,width: 45.w,),
                title: HeadingThree(data: 'spanish'.tr), // "Spanish" translated
                trailing: Radio<String>(
                  activeColor: AppColors.primaryColor,
                  value: 'es',
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                      Get.updateLocale(const Locale('es', 'MX'));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
