//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/app_images.dart';


import 'package:flutter/material.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_button_common.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../../routes/routes_name.dart';

class BodyFatProgressScreen extends StatefulWidget {
  @override
  _BodyFatProgressScreenState createState() => _BodyFatProgressScreenState();
}

class _BodyFatProgressScreenState extends State<BodyFatProgressScreen> {
  final List<String> imagePaths = [
    '${AppImages.bodyFatImg1}',
    '${AppImages.finalLogo}',
    '${AppImages.chicken}',
    '${AppImages.beef}',
    '${AppImages.chocolate}',
    '${AppImages.chocolate}',
    '${AppImages.bodyFatImg1}'
  ];
final List<String> progressText = [
  "5-9%",
  "10-14%",
  "20-24%",
  "25-29%",
  "30-34%",
  "35-39%",
  ">40%"
];
  // Variable to hold the current image index
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?; // Safely cast arguments
    final int? id = arguments?['id'];
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(text: "Body fat".tr,fontsize: 20.sp,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              CustomText(text: "What’s your current body fat?".tr,),
              SizedBox(height: 10.h,),
              // Display the image for the current step
              Image.asset(
                imagePaths[currentIndex.toInt()],
                width: 300,
                height: 300,
              ),

              SizedBox(height: 20.h),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 28.h,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                  activeTrackColor: Colors.redAccent,
                  inactiveTrackColor: Colors.red[200],
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.redAccent.withOpacity(0.2),
                ),
                child: Slider(
                  activeColor: Color(0xffFF5500),
                  inactiveColor: Color(0xffFF5500),
                  thumbColor: Color(0xffC009D0),
                  value: currentIndex,
                  min: 0,
                  max: imagePaths.length - 1.0,
                  divisions: imagePaths.length - 1,
                  onChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:22.h),
                child: CustomText(text: progressText[currentIndex.toInt()],),
              ),
              SizedBox(height: 10.h,),
              CustomButtonCommon(title: "Next", onpress: (){
                Get.toNamed(RouteNames.bodyFatScreen2, arguments: {'id': id}, preventDuplicates: false);
              }),
              SizedBox(height: 24.h),
              CustomText(text: "You can always fully customize your routine and diet afterwards.".tr,maxline: 2,),
            ],
          ),
      ),
    );
  }
}
class GradientSliderPainter extends CustomPainter {
  final double currentIndex;
  final int totalSteps;

  GradientSliderPainter(this.currentIndex, this.totalSteps);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint activeTrackPaint = Paint();
    final Paint inactiveTrackPaint = Paint();

    // Define the gradient for the active track
    final Rect activeTrackRect = Rect.fromLTRB(0, 0, (currentIndex / (totalSteps - 1)) * size.width, size.height);
    activeTrackPaint.shader = LinearGradient(
      colors: [Colors.redAccent, Colors.yellow], // Customize your gradient colors here
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(activeTrackRect);

    // Define the gradient for the inactive track
    final Rect inactiveTrackRect = Rect.fromLTRB(
        (currentIndex / (totalSteps - 1)) * size.width, 0, size.width, size.height);
    inactiveTrackPaint.shader = LinearGradient(
      colors: [Colors.grey[300]!, Colors.grey[400]!], // Inactive gradient colors
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(inactiveTrackRect);

    // Draw active track
    canvas.drawRect(activeTrackRect, activeTrackPaint);

    // Draw inactive track
    canvas.drawRect(inactiveTrackRect, inactiveTrackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint on slider change
  }
}
