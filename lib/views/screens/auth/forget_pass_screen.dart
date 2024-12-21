

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/helpers/helpers.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          title: HeadingTwo(data: 'forgetPass'.tr),
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
                  child: Column(
                    children: [
                      //==========================>Text Field<============================

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
                      SizedBox(
                        height: sizeH * .03,
                      ),

                      //==========================>Otp Button<============================

                      CustomTextButton(
                          text: 'forgetPassButton'.tr,
                          onTap: () {
                            // if(_emailTEController.text.isEmpty){
                            //   ToastMessageHelper.errorMessageShowToster("Enter Your Email");
                            // }else{
                            //
                            // }
                            Get.toNamed(
                              RouteNames.otpVerificationScreen,preventDuplicates: false
                            );
                          })
                    ],
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
  }
}
