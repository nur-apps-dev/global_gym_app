import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../global widget/global_widget.dart';
import '../../../../../../utlis/utils.dart';
import '../setting_screen.dart';

class ChangeResetPassScreen extends StatefulWidget {
  const ChangeResetPassScreen({super.key});

  @override
  State<ChangeResetPassScreen> createState() => _ChangeResetPassScreenState();
}

class _ChangeResetPassScreenState extends State<ChangeResetPassScreen> {
  final TextEditingController _rePassTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'reset_password'.tr), // Translated 'Reset Password'
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
                    // New Password Field
                    TextFormField(
                      controller: _passTEController,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'new_password'.tr, // Translated 'New Password'
                        prefixIcon: AppIcons.key,
                        suffixIcon: AppIcons.visibility,
                      ),
                    ),
                    SizedBox(height: sizeH * .016),

                    // Confirm Password Field
                    TextFormField(
                      controller: _rePassTEController,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'confirm_password'.tr, // Translated 'Confirm Password'
                        prefixIcon: AppIcons.key,
                        suffixIcon: AppIcons.visibility,
                      ),
                    ),
                    SizedBox(height: sizeH * .02),

                    // Reset Password Button
                    CustomTextButton(
                      text: 'reset_button'.tr, // Translated 'Reset Password'
                      onTap: () {
                        if (mounted) {
                          Get.offAll(const SettingScreen());
                        }
                      },
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

  @override
  void dispose() {
    _passTEController.dispose();
    _rePassTEController.dispose();
    super.dispose();
  }
}
