
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeadingTwo(data: 'signIn'.tr),
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
                padding: EdgeInsets.symmetric(horizontal: sizeW * .04),
                child: Form(
                  key: _formInKey,
                  child: Column(
                    children: [
                      ///==========================>Text Field<============================

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
                            child: Icon(Icons.key,color: AppColors.primaryColor,),
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

                      //==========================>Forget Button<============================
                      Align(
                          alignment: Alignment.centerRight,
                          child: StyleTextButton(
                              text: 'signInForgetPass'.tr,
                              onTap: () {
                                Get.toNamed(RouteNames.forgetPassScreen,preventDuplicates: false);
                              })),
                      SizedBox(
                        height: sizeH * .016,
                      ),
                      //==========================>Login Button<============================
                      CustomTextButton(text: 'signInLogin'.tr, onTap: () {
                        // if(_formInKey.currentState!.validate()){
                        //
                        // }
                        Get.toNamed(RouteNames.customNavBar,preventDuplicates: false);
                      }),
                      SizedBox(
                        height: sizeH * .02,
                      ),
                      //==========================>Don not  Have Account<============================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingThree(
                            data: 'signInDoNtHaveAccount'.tr,
                          ),
                          StyleTextButton(
                              text: 'signUp'.tr,
                              onTap: () {
                                Get.offAllNamed(RouteNames.singUpScreen);
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
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passTEController.dispose();
  }
}
