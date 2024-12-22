import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../../utlis/utils.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: HeadingTwo(data: "privacy_policy".tr),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(sizeH*.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               HeadingThree(data: 'privacy_policy'.tr),
              SizedBox(height: sizeH*.02,),
              Container(
                width: double.infinity,
                height: sizeH*.77,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:  EdgeInsets.all(sizeH*.016),
                child: SingleChildScrollView(
                    child: HtmlWidget(
                        "${AppString.policy}",
                        textStyle: TextStyle(
                          fontFamily: "Lora",
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18.sp,

                        )
                    ),
                    //HeadingThree(data: AppString.policy)
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
