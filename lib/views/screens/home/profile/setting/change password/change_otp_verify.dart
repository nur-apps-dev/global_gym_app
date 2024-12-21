import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../global widget/global_widget.dart';
import '../../../../../../utlis/utils.dart';
import 'change_reset_pass.dart';

class ChangeOtpVerificationScreen extends StatefulWidget {
  const ChangeOtpVerificationScreen({super.key});

  @override
  State<ChangeOtpVerificationScreen> createState() =>
      _ChangeOtpVerificationScreenState();
}

class _ChangeOtpVerificationScreenState
    extends State<ChangeOtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'otp_verify_email'.tr), // Translated 'Verify Email with OTP'
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
                    SizedBox(height: sizeH * .016),

                    // OTP Field
                    _buildPinCodeTextField(context),

                    SizedBox(height: sizeH * .016),

                    // Resend Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingThree(data: 'did_not_get_code'.tr), // Translated 'Didn't receive a code?'
                        StyleTextButton(
                          text: 'resend_otp'.tr, // Translated 'Resend OTP'
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH * .02),

                    // Verify OTP Button
                    CustomTextButton(
                        text: 'verify_otp'.tr, // Translated 'Verify OTP'
                        onTap: () {
                          Get.offAll(const ChangeResetPassScreen());
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // OTP Pin Code Field
  PinCodeTextField _buildPinCodeTextField(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return PinCodeTextField(
      textStyle: const TextStyle(color: Colors.white),
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: sizeH * .06,
        fieldWidth: sizeW * .11,
        activeFillColor: AppColors.iconColor,
        activeColor: AppColors.iconColor,
        selectedFillColor: AppColors.iconColor,
        selectedColor: AppColors.iconColor,
        inactiveFillColor: AppColors.iconColor,
        inactiveColor: AppColors.iconColor,
        errorBorderColor: Colors.red,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}
