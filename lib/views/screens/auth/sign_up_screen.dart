
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text_field.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          title: HeadingTwo(data: 'signUpAppBar'.tr),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(sizeH * .016),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo(),
               SizedBox(height: sizeH*.03,),
                Padding(
                  padding: EdgeInsets.all(sizeH * .016),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //==========================>Text Field<============================

                        ///Name===================
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomTextField(
                            controller: _nameTEController,
                            hintText: "signUpName".tr,
                            borderColor: AppColors.buttonColor,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 12.w),
                              child: SvgPicture.asset(AppIcons.profiles, color: AppColors.primaryColor, height: 24.h, width: 24.w),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                  return 'Please enter name'.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        ///Email
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomTextField(
                            controller: _emailTEController,
                            hintText:'globalEmail'.tr,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 12.w),
                              child: Icon(Icons.email_outlined,color: AppColors.primaryColor,)
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your email'.tr;
                              }else if(!AppConstants.emailValidate.hasMatch(value)){
                                return "Invalid email".tr;
                              }
                              return null;

                            },
                          ),
                        ),
                        ///password
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomTextField(
                            controller: _passTEController,
                            isPassword: true,
                            hintText:  'globalPass'.tr,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 12.w),
                              child: Icon(Icons.key, color: AppColors.primaryColor,),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your Password'.tr;
                              }else if(value.length < 8 || !AppConstants.validatePassword(value)){
                                return "Password: 8 characters min, letters & digits \nrequired".tr;
                              }
                              return null;

                            },
                          ),
                        ),

                        ///Con password
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomTextField(
                            controller: _confirmPassTEController,
                            isPassword: true,
                            hintText: 'Confirm Password'.tr,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 12.w),
                              child: Icon(Icons.key,color: AppColors.primaryColor,),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your Confirm Password'.tr;
                              }else if(value.length < 8 || !AppConstants.validatePassword(value)){
                                return "Password Not Match".tr;
                              }
                              return null;

                            },
                          ),
                        ),

                        //==========================>Register Button<============================
                        CustomTextButton(
                            text: 'signUp'.tr,
                            onTap: () {
                              // if(_formKey.currentState!.validate()){
                              //
                              // }
                              Get.toNamed(
                                RouteNames.informationOfClient,preventDuplicates: false
                              );
                            }),

                        SizedBox(
                          height: sizeH * .016,
                        ),
                        //==========================>Already Have Account<============================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadingThree(
                              data: 'alreadyAccount'.tr,
                            ),
                            StyleTextButton(
                                text: 'signIn'.tr,
                                onTap: () {
                                  Get.toNamed(
                                    RouteNames.signInScreen,preventDuplicates: false
                                  );
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _nameTEController.dispose();
    _confirmPassTEController.dispose();
    _passTEController.dispose();
  }
}
