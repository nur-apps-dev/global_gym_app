
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../../global widget/global_widget.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utlis/utils.dart';
import '../../../widgets/widgets.dart';

class BodyFatProgressScreen2 extends StatefulWidget {
  @override
  _BodyFatProgressScreen2State createState() => _BodyFatProgressScreen2State();
}

class _BodyFatProgressScreen2State extends State<BodyFatProgressScreen2> {
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
            CustomText(text: "What’s your bodyfat goal?".tr,maxline: 2,),
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
                trackHeight: 24.h,
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
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left:22.h),
              child: CustomText(text: progressText[currentIndex.toInt()],),
            ),
            // SliderTheme(
            //   data: SliderTheme.of(context).copyWith(
            //     trackHeight: 24.0,
            //     thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 18),
            //     overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
            //     activeTrackColor: Colors.redAccent,
            //     inactiveTrackColor: Colors.red[200],
            //     thumbColor: Colors.redAccent,
            //     overlayColor: Colors.redAccent.withOpacity(0.2),
            //     trackShape: const RoundedRectSliderTrackShape(),
            //   ),
            //   child: Slider(
            //     value: currentIndex,
            //     min: 0,
            //     max: imagePaths.length - 1.0,
            //     divisions: imagePaths.length - 1,
            //     onChanged: (value) {
            //       setState(() {
            //         currentIndex = value;
            //       });
            //     },
            //   ),
            // ),

            CustomButtonCommon(title: "Generate Routine".tr, onpress: (){
             id == null ? Get.toNamed(RouteNames.routineGenerate1,preventDuplicates: false):
             showModalBottomSheet(
               context: context,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
               ),
               builder: (BuildContext context) {
                 return Padding(
                   padding: EdgeInsets.all(20.w),
                   child: Column(
                     mainAxisSize: MainAxisSize.min, // Fit the content
                     children: [
                       // Bottom sheet title
                       Container(
                         margin: EdgeInsets.only(bottom: 10.h),
                         height: 4.h,
                         width: 40.w,
                         decoration: BoxDecoration(
                           color: Colors.grey[300],
                           borderRadius: BorderRadius.circular(10.r),
                         ),
                       ),
                       Text(
                         'disclaimer'.tr,
                         style: TextStyle(
                           fontSize: 18.sp,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       SizedBox(height: 10.h),

                       // Disclaimer Text
                       Text(
                         'disclaimerText'.tr,
                         style: TextStyle(fontSize: 14.sp),
                         textAlign: TextAlign.start,
                       ),
                       SizedBox(height: 20.h),

                       // Cancel and Agree buttons
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Expanded(child: CustomTextButton(text: 'cancel'.tr, onTap: (){Get.back();})),
                           SizedBox(width: 10.w),
                           Expanded(
                             // child: CustomTextButton(text: 'agree'.tr, onTap: (){Get.offAllNamed(RouteNames.subscriptionScreen);}, color: Colors.green),
                             child: CustomTextButton(text: 'agree'.tr, onTap: (){
                             //  Get.toNamed(RouteNames.bodyFatScreen,preventDuplicates: false);
                               Get.back();
                               }, color: Colors.green),
                           ),
                         ],
                       ),
                     ],
                   ),
                 );
               },
             );
            }),
            SizedBox(height: 24.h),
            CustomText(text: "You can always fully customize your routine and diet afterwards.".tr,maxline: 2,),
          ],
        ),
      ),
    );
  }
}






// class BodyFatProgressScreen2 extends StatefulWidget {
//   @override
//   _BodyFatProgressScreen2State createState() =>
//       _BodyFatProgressScreen2State();
// }
//
// class _BodyFatProgressScreen2State extends State<BodyFatProgressScreen2> {
//   final List<String> imagePaths = [
//     '${AppImages.bodyFatImg1}',
//     '${AppImages.finalLogo}',
//     '${AppImages.chicken}',
//     '${AppImages.beef}',
//     '${AppImages.chocolate}',
//     '${AppImages.chocolate}',
//     '${AppImages.bodyFatImg1}'
//   ];
//   final List<String> progressText = [
//     "5-9%",
//     "10-14%",
//     "20-24%",
//     "25-29%",
//     "30-34%",
//     "35-39%",
//     ">40%"
//   ];
//   // Variable to hold the current image index
//   double currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Body fat".tr, fontsize: 20.sp),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10.h),
//             CustomText(text: "What’s your bodyfat goal?".tr, maxline: 2),
//             SizedBox(height: 10.h),
//             // Display the image for the current step
//             Image.asset(
//               imagePaths[currentIndex.toInt()],
//               width: 300,
//               height: 300,
//             ),
//             SizedBox(height: 20.h),
//             // Slider with custom gradient track
//             Stack(
//               children: [
//                 CustomPaint(
//                   size: Size(double.infinity, 24.h),
//                   painter: GradientSliderPainter(currentIndex, imagePaths.length),
//                 ),
//                 Positioned(
//                   bottom: -14.h,
//                   child: Slider(
//                   value: currentIndex,
//                   min: 0,
//                   max: imagePaths.length - 1.0,
//                   divisions: imagePaths.length - 1,
//                   onChanged: (value) {
//                     setState(() {
//                       currentIndex = value;
//                     });
//                   },
//                   thumbColor: Colors.redAccent,
//                   activeColor: Colors.transparent,
//                   inactiveColor: Colors.transparent,
//                                   ),
//                 )
//               ],
//             ),
//
//             SizedBox(height: 10.h),
//             Padding(
//               padding: EdgeInsets.only(left: 22.h),
//               child: CustomText(text: progressText[currentIndex.toInt()]),
//             ),
//             // CustomPainter on the Slider Track
//
//             SizedBox(height: 20.h),
//             CustomButtonCommon(title: "Next", onpress: () {}),
//             SizedBox(height: 24.h),
//             CustomText(
//               text: "You can always fully customize your routine and diet afterwards.".tr,
//               maxline: 2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class GradientSliderPainter extends CustomPainter {
//   final double currentIndex;
//   final int totalSteps;
//
//   GradientSliderPainter(this.currentIndex, this.totalSteps);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint activeTrackPaint = Paint();
//     final Paint inactiveTrackPaint = Paint();
//
//     // Define the gradient for the active track
//     final Rect activeTrackRect = Rect.fromLTRB(0, 0, (currentIndex / (totalSteps - 1)) * size.width, size.height);
//     activeTrackPaint.shader = LinearGradient(
//       colors: [Colors.redAccent, Colors.yellow], // Customize your gradient colors here
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     ).createShader(activeTrackRect);
//
//     // Define the gradient for the inactive track
//     final Rect inactiveTrackRect = Rect.fromLTRB(
//         (currentIndex / (totalSteps - 1)) * size.width, 0, size.width, size.height);
//     inactiveTrackPaint.shader = LinearGradient(
//       colors: [Colors.grey[300]!, Colors.grey[400]!], // Inactive gradient colors
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     ).createShader(inactiveTrackRect);
//
//     // Draw active track
//     canvas.drawRect(activeTrackRect, activeTrackPaint);
//
//     // Draw inactive track
//     canvas.drawRect(inactiveTrackRect, inactiveTrackPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Repaint on slider change
//   }
// }
