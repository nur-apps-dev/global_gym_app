import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global widget/global_widget.dart';
import '../../../../../../utlis/utils.dart';
import '../../../../screens.dart';

class ChangeForgetPassScreen extends StatefulWidget {
  const ChangeForgetPassScreen({super.key});

  @override
  State<ChangeForgetPassScreen> createState() => _ChangeForgetPassScreenState();
}

class _ChangeForgetPassScreenState extends State<ChangeForgetPassScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'forgot_password'.tr), // Translated 'Forgot Password'
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              Padding(
                padding: EdgeInsets.all(sizeH * .016),
                child: Column(
                  children: [
                    // Text Field
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'email'.tr, // Translated 'Email'
                        prefixIcon: AppIcons.email,
                      ),
                    ),
                    SizedBox(height: sizeH * .03),

                    // Send OTP Button
                    CustomTextButton(
                        text: 'send_otp'.tr, // Translated 'Send OTP'
                        onTap: () {
                          Get.offAll(const ChangeOtpVerificationScreen());
                        }
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

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
