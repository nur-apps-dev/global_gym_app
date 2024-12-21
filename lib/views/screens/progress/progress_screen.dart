import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../global widget/global_widget.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final TextEditingController repsController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
String  selectedContainer = "Recent activity";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: double.infinity,

        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                ///=========================Monthly and  Yearly Button==========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                             border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(child: CustomText(text: "Monthly".tr,))),
                    Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(child: CustomText(text: "Yearly".tr,))),
          
          
          
                  ],
                ),
                SizedBox(height: 20.h,),
                ///===============================progress=====================================
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight Chart'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '/December 2024'.tr,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child:WeightChart(
                          weightData: {
                            '10 Sep': 45,
                            '11 Sep': 45,
                            '12 Sep': 45,
                            '13 Sep': 405,
                            '14 Sep': 45,
                            '15 Sep': 100,
                            '16 Sep': 100,                        
                            '20 Sep': 200,
                            '25 Sep': 88,
                            '30 Sep': 305,
          
                          },
                        ),
          
                      ),
                      SizedBox(height: 10.h,),
                      Divider(color: AppColors.primaryColor,height: 14.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '15 Sep',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '27 Sep',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
          
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                ///===============================Wight button=====================================
                CustomTextButton(
                  text: 'Weight in'.tr,
                  color: AppColors.primaryColor,
                  onTap: () {
                    // Handle add new food functionality
                    _showTrackRepsBottomSheet();
          
          
                  },
                ),
                ///===============================Wight box=====================================
                SizedBox(height: 20.h,),
                SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _weightBox(
                      boxValue: "0",
                       boxText: "Workouts"
                      ), _weightBox(
                      boxValue: "0",
                       boxText: "Sets"
                      ), _weightBox(
                      boxValue: "0",
                       boxText: "Reps"
                      ), _weightBox(
                      boxValue: "0",
                       boxText: "kg lifted"
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                ///===============================3 button=====================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSelectableContainer("Recent activity".tr),
                    SizedBox(width: 10),
                    _buildSelectableContainer("Badges".tr),
                    SizedBox(width: 10),
                    _buildSelectableContainer("Leaderboard".tr),
                  ],
                ),
                SizedBox(height: 20.h,),
                ///===============================Strack=====================================

                SizedBox(
                  height: 500.h,
                  child: selectedContainer == "Recent activity" ? ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                  return Card(
                     color: Colors.white.withOpacity(0.8),
                     child: ExpansionTile(
                       title: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           CustomNetworkImage(
                             imageUrl: AppImages.chicken,
                             borderRadius: BorderRadius.circular(12.r),
                             height: 50.h,
                             width: 50.w,
                           ),
                           SizedBox(width: 10.w,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CustomText(text: "Tuesday-leg day".tr, fontsize: 12.sp,textAlign: TextAlign.start,),
                               //   Center(child: Text( DateFormat('MM-dd-yyyy').format(DateTime.parse("18-11-2024")))),

                               CustomText(text: "18-11-2024".tr, fontsize: 14.sp),
                             ],
                           ),

                           IconButton(onPressed: () {}, icon: AppIcons.fire),
                           CustomText(text: "32 Streak".tr,fontsize: 10.sp,),
                         ],
                       ),
                       children: [
                         /// Sets Reps Time======================================
                         Divider(),
                         /// Sets Reps Time======================================
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               children: [
                                 CustomText(text: "21".tr, fontsize: 18.sp),
                                 CustomText(text: "Sets".tr, fontsize: 18.sp),
                               ],
                             ),

                             Column(
                               children: [
                                 CustomText(text: "21".tr, fontsize: 18.sp),
                                 CustomText(text: "Reps".tr, fontsize: 18.sp),
                               ],
                             ),
                             Column(
                               children: [
                                 CustomText(text: "32:20".tr, fontsize: 18.sp),
                                 CustomText(text: "Time".tr, fontsize: 18.sp),
                               ],
                             ),
                           ],
                         ),
                         Divider(),
                         /// ACTIVITY iCON======================================
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Container(
                               height: 100.h,
                               child: Column(children: [
                                 SvgPicture.asset(
                                   AppIcons.activityIcon,
                                   width: 60.h,
                                   height: 60.h,
                                 ),
                                 SizedBox(height: 6.h,),
                                 CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                               ],),
                             ),
                             Container(
                               height: 100.h,
                               child: Column(children: [
                                 SvgPicture.asset(
                                   AppIcons.activityIcon,
                                   width: 60.h,
                                   height: 60.h,
                                 ),
                                 SizedBox(height: 6.h,),
                                 CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                               ],),
                             ),
                             Container(
                               height: 100.h,
                               child: Column(children: [
                                 SvgPicture.asset(
                                   AppIcons.activityIcon,
                                   width: 60.h,
                                   height: 60.h,
                                 ),
                                 SizedBox(height: 6.h,),
                                 CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                               ],),
                             ),
                           ],
                         ),
                         SizedBox(height: 10.h,),
                       ],
                     ),
                   );
                  },
                            ):

                  selectedContainer == "Badges"?
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,

                       children: [

                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: AppColors.primaryColor),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                             SvgPicture.asset(
                               AppIcons.badges,
                               width: 60.h,
                               height: 60.h,
                             ),
                             SizedBox(height: 6.h,),
                             CustomText(text: "Early Bird".tr,fontsize: 10.sp,),
                           ],),
                         ),

                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                               SvgPicture.asset(
                                 AppIcons.badges,
                                 width: 60.h,
                                 height: 60.h,
                               ),
                               SizedBox(height: 6.h,),
                               CustomText(text: "Power lifter".tr,fontsize: 10.sp,),
                             ],),
                         ),

                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                               SvgPicture.asset(
                                 AppIcons.badges,
                                 width: 60.h,
                                 height: 60.h,
                               ),
                               SizedBox(height: 6.h,),
                               CustomText(text: "Master".tr,fontsize: 10.sp,),
                             ],),
                         ),

                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                               SvgPicture.asset(
                                 AppIcons.badges,
                                 width: 60.h,
                                 height: 60.h,
                               ),
                               SizedBox(height: 6.h,),
                               CustomText(text: "No excuse".tr,fontsize: 10.sp,),
                             ],),
                         ),

                       ],
                     ),
                     SizedBox(height: 24.h,),
                     CustomText(text: "Exercise Time".tr, fontsize: 14.sp,textAlign: TextAlign.start,),
                     SizedBox(height: 14.h,),
                     Container(
                       height: 100.h,
                       width: 80.w,
                       decoration: BoxDecoration(
                           border: Border.all(color: AppColors.primaryColor),
                           borderRadius: BorderRadius.circular(10.r)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(height: 6.h,),
                           SvgPicture.asset(
                             AppIcons.badges,
                             width: 60.h,
                             height: 60.h,
                           ),
                           SizedBox(height: 6.h,),
                           CustomText(text: "Early Bird".tr,fontsize: 10.sp,),
                         ],),
                     ),

                     SizedBox(height: 24.h,),
                     CustomText(text: "Exercise Sets".tr, fontsize: 14.sp,textAlign: TextAlign.start,),
                     SizedBox(height: 14.h,),
                     Row(mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: AppColors.primaryColor),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                               SvgPicture.asset(
                                 AppIcons.badges,
                                 width: 60.h,
                                 height: 60.h,
                               ),
                               SizedBox(height: 6.h,),
                               CustomText(text: "Early Bird".tr,fontsize: 10.sp,),
                             ],),
                         ),
                         SizedBox(width: 10.w,),
                         Container(
                           height: 100.h,
                           width: 80.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: AppColors.primaryColor),
                               borderRadius: BorderRadius.circular(10.r)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height: 6.h,),
                               SvgPicture.asset(
                                 AppIcons.badges,
                                 width: 60.h,
                                 height: 60.h,
                               ),
                               SizedBox(height: 6.h,),
                               CustomText(text: "Early Bird".tr,fontsize: 10.sp,),
                             ],),
                         ),
                       ],
                     ),
                   ],
                 ):ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white.withOpacity(0.8),
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              CustomNetworkImage(
                                imageUrl: AppImages.chicken,
                                borderRadius: BorderRadius.circular(12.r),
                                height: 50.h,
                                width: 50.w,
                              ),
                              SizedBox(width: 10.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "John Abraham".tr, fontsize: 12.sp,textAlign: TextAlign.start,),
                                  //   Center(child: Text( DateFormat('MM-dd-yyyy').format(DateTime.parse("18-11-2024")))),
                                ],
                              ),

                              IconButton(onPressed: () {}, icon: AppIcons.fire),
                              CustomText(text: "32 Streak".tr,fontsize: 10.sp,),
                            ],
                          ),
                          children: [


                            Divider(),
                            /// ACTIVITY iCON======================================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 100.h,
                                  child: Column(children: [
                                    SvgPicture.asset(
                                      AppIcons.activityIcon,
                                      width: 60.h,
                                      height: 60.h,
                                    ),
                                    SizedBox(height: 6.h,),
                                    CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                                  ],),
                                ),
                                Container(
                                  height: 100.h,
                                  child: Column(children: [
                                    SvgPicture.asset(
                                      AppIcons.activityIcon,
                                      width: 60.h,
                                      height: 60.h,
                                    ),
                                    SizedBox(height: 6.h,),
                                    CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                                  ],),
                                ),
                                Container(
                                  height: 100.h,
                                  child: Column(children: [
                                    SvgPicture.asset(
                                      AppIcons.activityIcon,
                                      width: 60.h,
                                      height: 60.h,
                                    ),
                                    SizedBox(height: 6.h,),
                                    CustomText(text: "Try hard".tr,fontsize: 10.sp,),
                                  ],),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _weightBox({required String boxValue,required String boxText}){
    return Container(
      height: 74.h,
      width: 74.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(text: boxValue,fontsize: 30,fontWeight: FontWeight.w600,color: AppColors.primaryColor,),
          CustomText(text: boxText,fontsize: 12,),
          SizedBox(height: 2.h,)
        ],),
    );
  }
  void _showTrackRepsBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeadingTwo(
                  data: 'Track your weights'.tr,
                ),

                SizedBox(height: 16.h),
                Row(
                  children: [

                    Expanded(
                      child: CustomTextField(
                        controller: repsController,
                        hintText:  'weightKg'.tr,
                        borderColor: Color(0xff586260),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your weight'.tr;
                          }
                          return null;

                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomTextField(
                        controller: repsController,
                        hintText:  'Date'.tr,
                        borderColor: Color(0xff586260),
                        suffixIcon: Icon(Icons.date_range),
                        onChange: (value){},
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Date'.tr;
                          }
                          return null;

                        },
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 16.h),
                CustomTextButton(
                    text: 'Submit'.tr,
                    onTap: () {
                      if(_formKey.currentState!.validate()){

                      }
                      // Get.back();
                      // Get.back();
                    }),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _buildSelectableContainer(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainer = label; // Update selected container
        });
      },
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedContainer == label
                ? AppColors.primaryColor
                : AppColors.textColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding:  EdgeInsets.all(6.r),
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

// class WeightChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint linePaint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 2;
//
//     final Paint dotPaint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill;
//
//     // Draw the base line
//     canvas.drawLine(
//       Offset(0, size.height - 80),
//       Offset(size.width, size.height - 40),
//       linePaint,
//     );
//
//     // Coordinates for weight points
//     final Offset point1 = Offset(size.width * 0.4, size.height * 1);
//     final Offset point2 = Offset(size.width * 0.7, size.height * 0.6);
//
//     // Draw the weight line
//     final Paint weightLinePaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;
//     canvas.drawLine(point1, point2, weightLinePaint);
//
//     // Draw dots for weight points
//     canvas.drawCircle(point1, 5, dotPaint);
//     canvas.drawCircle(point2, 5, dotPaint);
//
//     // Draw weight labels
//     final TextPainter tp1 = TextPainter(
//       text: TextSpan(
//         text: '90 kg',
//         style: TextStyle(color: Colors.red, fontSize: 12),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     tp1.layout();
//     tp1.paint(canvas, Offset(point1.dx - 15, point1.dy - 25));
//
//     final TextPainter tp2 = TextPainter(
//       text: TextSpan(
//         text: '87 kg',
//         style: TextStyle(color: Colors.red, fontSize: 12),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     tp2.layout();
//     tp2.paint(canvas, Offset(point2.dx - 15, point2.dy - 25));
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
class WeightChart extends StatelessWidget {
  final Map<String, int> weightData;

  WeightChart({required this.weightData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomPaint(
        size: Size(500, 300), // Set chart canvas size
        painter: WeightChartPainter(weightData: weightData),
      ),
    );
  }
}

class WeightChartPainter extends CustomPainter {
  final Map<String, int> weightData;

  WeightChartPainter({required this.weightData});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final Paint dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final double margin = 30.0; // Margin from edges
    final double chartHeight = size.height - margin * 2;
    final double chartWidth = size.width - margin * 2;

    // Get sorted dates and weights
    final List<String> dates = weightData.keys.toList();
    final List<int> weights = weightData.values.toList();

    // Find the range of weights and add scaling
    final int maxWeight = weights.reduce((a, b) => a > b ? a : b);
    final int minWeight = weights.reduce((a, b) => a < b ? a : b);
    final double weightRange = (maxWeight - minWeight).toDouble();

    // Add padding to the weight range for better scaling
    final double scaleRange = weightRange == 0 ? 10 : weightRange * 1.2;

    // Define horizontal spacing
    final double spacing = chartWidth / (dates.length - 1);

    // Draw chart lines and dots
    for (int i = 0; i < dates.length - 1; i++) {
      final double x1 = margin + i * spacing;
      final double y1 = margin + chartHeight * (1 - (weights[i] - minWeight) / scaleRange);
      final double x2 = margin + (i + 1) * spacing;
      final double y2 = margin + chartHeight * (1 - (weights[i + 1] - minWeight) / scaleRange);

      // Draw connecting line
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);

      // Draw dots
      canvas.drawCircle(Offset(x1, y1), 5, dotPaint);
    }

    // Draw the last dot
    final double lastX = margin + (dates.length - 1) * spacing;
    final double lastY = margin + chartHeight * (1 - (weights.last - minWeight) / scaleRange);
    canvas.drawCircle(Offset(lastX, lastY), 5, dotPaint);

    // Draw labels
    for (int i = 0; i < dates.length; i++) {
      final double x = margin + i * spacing;
      final double y = margin + chartHeight * (1 - (weights[i] - minWeight) / scaleRange);

      // Draw weight label
      final TextPainter weightLabel = TextPainter(
        text: TextSpan(
          text: '${weights[i]} kg',
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      weightLabel.layout();
      weightLabel.paint(canvas, Offset(x - 20, y - 20));

      // Draw date label
      final TextPainter dateLabel = TextPainter(
        text: TextSpan(
          text: dates[i],
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      dateLabel.layout();
      dateLabel.paint(canvas, Offset(x - 20, size.height - margin));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint if data changes
  }
}
