import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../../../global widget/global_widget.dart';
import '../../../../../../utlis/utils.dart';

import '../../../../../widgets/widgets.dart';
import '../../../../screens.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController _oldPassTEController = TextEditingController();
  final TextEditingController _rePassTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'change_password'.tr), // Translated 'Change Password'
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              SizedBox(height: sizeH * .05),
              ///old password
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomTextField(
                  controller: _oldPassTEController,
                  isPassword: true,
                  hintText: 'old_password'.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 12.w),
                    child: Icon(Icons.key,color: AppColors.primaryColor,),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'old_password'.tr;
                    }else if(value.length < 8 || !AppConstants.validatePassword(value)){
                      return "Password Not Match".tr;
                    }
                    return null;

                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomTextField(
                  controller: _passTEController,
                  isPassword: true,
                  hintText: 'new_password'.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 12.w),
                    child: Icon(Icons.key,color: AppColors.primaryColor,),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'new_password'.tr;
                    }else if(value.length < 8 || !AppConstants.validatePassword(value)){
                      return "Password Not Match".tr;
                    }
                    return null;

                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomTextField(
                  controller: _rePassTEController,
                  isPassword: true,
                  hintText: 'new_password'.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 12.w),
                    child: Icon(Icons.key,color: AppColors.primaryColor,),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'new_password'.tr;
                    }else if(value.length < 8 || !AppConstants.validatePassword(value)){
                      return "Password Not Match".tr;
                    }
                    return null;

                  },
                ),
              ),


              StyleTextButton(
                  text: 'forgot_password'.tr, // Translated 'Forgot Password'
                  onTap: () {
                    Get.to(const ChangeForgetPassScreen());
                  }
              ),

              SizedBox(height: sizeH * .02),

              // Reset Password Button
              CustomTextButton(
                  text: 'change_password'.tr, // Translated 'Change Password'
                  onTap: () {
                    Get.back();
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passTEController.dispose();
    _rePassTEController.dispose();
    _oldPassTEController.dispose();
  }
}
