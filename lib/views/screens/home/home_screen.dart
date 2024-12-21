import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../global widget/global_widget.dart';
import '../../../utlis/utils.dart';
import '../screens.dart'; // Add this package



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(

      body: SingleChildScrollView(
        padding:  EdgeInsets.all(sizeH*.016),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Macros Section
            Container(
              margin: EdgeInsets.symmetric(vertical: sizeH*.012),
              padding: EdgeInsets.all(sizeH*.01),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               HeadingThree(data: 'home_macros'.tr),
                   const Center(
                    child: CalorieProgressBar(
                      currentCalories: 800, // Current value
                      totalCalories: 2100, // Total value
                    ),
                  ),
                  SizedBox(height: sizeH*.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMacroProgress('home_carbs'.tr, 50, 135, Colors.red),
                      _buildMacroProgress('home_fat'.tr, 50, 135, Colors.orange),
                      _buildMacroProgress('home_protein'.tr, 50, 135, Colors.green),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeH*.02),
            HeadingThree(data: 'Your Workout'.tr),
            SizedBox(
              height: sizeH * .016,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.635
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomCard(
                    img: AppImages.workout,
                    title: 'Monday'.tr,
                    title1: "Legs Day".tr,
                    text2Color: Colors.red,
                    buttonText: 'Go to exercise'.tr,
                    onTap: () {
                      final navBarState = Get.find<CustomNavbarState>();
                      navBarState.setCurrentIndex(1);

                      // Navigate to workout screen
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: sizeH * .016,
            ),
            HeadingThree(data: 'meal_title'.tr),
            SizedBox(
              height: sizeH * .016,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.635
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomCard(
                    img: AppImages.meal,
                    title: 'Breakfast'.tr,
                    buttonText: 'Eat Now'.tr,
                    onTap: () {
                      final navBarState = Get.find<CustomNavbarState>();
                      navBarState.setCurrentIndex(3);
                    },
                  );
                },
              ),
            ),

            // Other Sections like Workout and Meal Plan here...
          ],
        ),
      ),
    );
  }

  // Macro Progress Widget
  Widget _buildMacroProgress(String label, int value, int total, Color color) {
    return Column(
      children: [

        Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
        SizedBox(height: 10.h,),
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: value / total,
          center: Text(
            "$value/$total g",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
        SizedBox(height: 10.h),

        Text('${total - value} ${'home_left'.tr}'), // Translated "left"
      ],
    );
  }
}

class CalorieProgressBar extends StatelessWidget {
  final double currentCalories;
  final double totalCalories;

  const CalorieProgressBar({
    Key? key,
    required this.currentCalories,
    required this.totalCalories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate progress percentage
    final double progress = currentCalories / totalCalories;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "Calorie Count",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              Text(
                "${currentCalories.toInt()}/${totalCalories.toInt()} kcal",
                style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
           SizedBox(height: 8.h),
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress, // Fraction of total progress (0.0 - 1.0)
              minHeight: 18.h,
              color: Colors.yellow,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
