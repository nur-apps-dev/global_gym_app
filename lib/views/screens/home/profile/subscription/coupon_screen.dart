import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

import '../../../../../global widget/global_widget.dart';
import '../../../../../utlis/utils.dart';
import '../../../../widgets/widgets.dart';


class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  final TextEditingController _couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('coupon_title'.tr), // "Gym Member Coupon" translated
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeW * 0.05, vertical: sizeH * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Enter Code Label
             HeadingThree(data: 'coupon_enter_code'.tr,),
              SizedBox(height: sizeH * 0.02),

              // Code Input Field
              ///password
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomTextField(
                  controller: _couponController,
                  hintText:  'coupon_enter_code'.tr,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'coupon_enter_codee'.tr;
                    }
                    return null;

                  },
                ),
              ),

              SizedBox(height: sizeH * 0.02),

              // Confirm Button
              CustomTextButton(
                text: 'coupon_confirm'.tr, // "Confirm" translated
                onTap: () {
                  Get.offAllNamed(RouteNames.customNavBar);
                },

              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }
}
