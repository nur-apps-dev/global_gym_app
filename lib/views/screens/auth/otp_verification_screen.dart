
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';



class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}



class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(

        title: CustomText(text: 'otpVerifyEmail'.tr ,fontsize: 18.sp, )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(sizeH * .016),
                child: Column(
                  children: [
                    const AppLogo(),
                    SizedBox(height: sizeH*.03,),
                    //==========================>Otp Field<============================
                    _buildPinCodeTextField(context),
                    SizedBox(height: sizeH * .016),
                    //==========================>Resend Button<============================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingThree(data: 'otpDidNtGetCode'.tr),
                        StyleTextButton(text: 'otpResend'.tr, onTap: () {}),
                      ],
                    ),
                    SizedBox(height: sizeH * .02),
                    //==========================>Otp Button<============================
                    CustomTextButton(
                      text: 'otpVerifyButton'.tr,
                      onTap: () {
                        // Check if the widget is mounted before navigating
                        if (mounted) {
                          Get.toNamed(RouteNames.resetPassScreen,preventDuplicates: false);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // pin code field
  PinCodeTextField _buildPinCodeTextField(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return PinCodeTextField(
      textStyle: const TextStyle(color: Colors.black), // Text color
      length: 6, // Number of pin code characters
      obscureText: false,
      animationType: AnimationType.fade, // Animation style
      keyboardType: TextInputType.number, // Numeric input
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle, // Circular pin fields
        fieldHeight: sizeH * 0.07, // Adjust height based on screen size
        fieldWidth: sizeW * 0.13, // Adjust width based on screen size
        activeFillColor:AppColors.grayColor,// Active field background color
        selectedFillColor: AppColors.grayColor, // Selected field background color
        selectedColor: AppColors.buttonColor, // Border color when selected
        inactiveFillColor: AppColors.grayColor, // Inactive field background color
        inactiveColor: AppColors.buttonColor, // Border color when inactive
        errorBorderColor: AppColors.buttonColor
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent, // Transparent background
      enableActiveFill: true, // Enable filling of active field
      controller: _otpTEController, // Controller to manage OTP input
      appContext: context, // Current app context
    );
  }

  // @override
  // void dispose() {
  //   // Dispose the TextEditingController before calling super.dispose()
  //   _otpTEController.dispose();
  //   super.dispose();
  // }
}

