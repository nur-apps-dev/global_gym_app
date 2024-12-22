
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../screens.dart';

class MealPlanScreen extends StatefulWidget {
  const  MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}
// Weekday names
final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
// Calendar days for the month
final List<int> dates = List<int>.generate(7, (index) => index + 1);

// To dynamically assign colors
Color getColor(int day) {
  if (day % 7 == 1) return Colors.red; // Highlighted Red
  if (day % 7 == 2) return Colors.amber; // Highlighted Amber
  if (day % 7 == 3) return Colors.green; // Highlighted Green
  return Colors.grey[300]!; // Default Grey
}
class _MealPlanScreenState extends State<MealPlanScreen> {
  final List<DateItem> datess = [
    DateItem(day: 'Mon', date: '12', progress: 0.3),
    DateItem(day: 'Tue', date: '13', progress: 0.6),
    DateItem(day: 'Wed', date: '14', progress: 1.0),
    DateItem(day: 'Thu', date: '15', progress: null),
    DateItem(day: 'Fri', date: '16', progress: 0.4),
    DateItem(day: 'Sat', date: '17', progress: 0.1),
    DateItem(day: 'Sun', date: '18', progress: 0.5),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: Get.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                CustomCard(
                  img: AppImages.meal,
                  title: 'Get Ready for the Healthy Diet'.tr,
                  buttonText: 'Update Your Plan'.tr,
                  onTap: () {
                    Get.toNamed(
                      RouteNames.mealInfo,
                      arguments: {'id': 123}, // Replace 123 with your dynamic id
                      preventDuplicates: false,
                    );
                  },
                ),

                SizedBox(height: 20.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "December",),
                    CustomText(text: "January",)
                  ],
                ),
                SizedBox(height: 80.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: datess
                          .map((dateItem) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0,
                        vertical: 6),
                        child: DateCircle(dateItem: dateItem),
                      ))
                          .toList(),
                    ),
                  ),
                ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: sizeH * .012),
                  padding: EdgeInsets.all(sizeH * .01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: sizeH * .01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
                        children: [
                          // Left Macro Progress
                          Expanded(
                            child: _buildMacroProgress('Dec-14'.tr, 800, 2100, Colors.red,"Daily"),
                          ),
                          // Center Column for calorie progress bars
                          Expanded(
                            flex: 2, // Give the center column more space
                            child: Column(
                              children: [
                                Center(
                                  child: calorieProgressBar(
                                    currentCalories: 35,
                                    totalCalories: 120,
                                    Calories: "Carbs".tr,
                                    progressColor: Colors.redAccent,
                                  ),
                                ),
                                Center(
                                  child: calorieProgressBar(
                                    currentCalories: 55,
                                    totalCalories: 120,
                                    Calories: "Protine".tr,
                                    progressColor: Colors.yellow,
                                  ),
                                ),
                                Center(
                                  child: calorieProgressBar(
                                    currentCalories: 65,
                                    totalCalories: 120,
                                    Calories: "Fat".tr,
                                    progressColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right Macro Progress
                          Expanded(
                            child: _buildMacroProgress('Dec 7-14'.tr, 1800, 2100, Colors.green, "Weekly"),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CustomText(text: "Today".tr,fontsize: 20.sp,),
                SizedBox(height: 10.h,),
                CustomTextButton(
                    text: '+ Add New Meal'.tr,
                    color: Color(0xff999999),
                    onTap: () {
                    // /  Get.toNamed(RouteNames.addExercise,preventDuplicates: false);

                    }),
                SizedBox(height: 10.h,),

                ///=========ExpansionTile================================
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(vertical: sizeH * .010, horizontal: 8.0), // Adjust padding for appearance
                        leading:
                        ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(AppImages.meal, width: sizeW * 0.15),),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Break fast",fontsize: 16.sp,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: CustomText(
                                      text: "Fat 135g".tr,
                                      maxline: 3,
                                      fontsize: 10.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: CustomText(
                                      text: "Carbs 135g".tr,
                                      maxline: 3,
                                      fontsize: 10.sp,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(2.r),
                                      child: CustomText(
                                        text: "Protein 135g".tr,
                                        maxline: 3,
                                        fontsize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.check_circle, color: AppColors.primaryColor),
                                ),

                              ],
                            ),
                          ],
                        ),
                        children: [
                          Container(
                            height: 300.h,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: 6,
                                    itemBuilder: (context, Index) {
                                      return  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.pin_drop_rounded,   color: Color(0xff999999),),
                                          ),
                                          Image.asset(AppImages.carrots,height: 40.h,width: 40.w,),
                                          SizedBox(width: 10.w,),
                                          CustomText(text: "Beef",fontsize: 18.sp,),
                                          CustomText(text: "350 Cal(150g)",),
                                          IconButton(
                                            onPressed: () {

                                            },
                                            icon: const Icon(Icons.delete,   color: Color(0xff999999),),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(6.r),
                                  child: CustomTextButton(
                                      text: '+ Add New Food'.tr,
                                      color: Color(0xff999999),
                                      onTap: () {
                                        Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);

                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  // Macro Progress Widget
  Widget _buildMacroProgress(String label, int value, int total, Color color,String dailyWeek) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.h,),
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
            "$value\n/$total g",
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
        SizedBox(height: 10.h),
        Text('${dailyWeek} ${'Calories'.tr}',style: TextStyle(fontSize: 10.sp,),),
      ],
    );
  }
  Widget calorieProgressBar({required double currentCalories, required double totalCalories,required String Calories, required Color progressColor} ){
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
                Calories,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
              ),
              Text(
                "${currentCalories.toInt()}/${totalCalories.toInt()} g",
                style:  TextStyle(
                  fontSize: 11.sp,
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
              minHeight: 10.h,
              color: progressColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }


}




class DayCircle extends StatelessWidget {
  final String day;
  final int date;
  final Color color;

  const DayCircle({
    Key? key,
    required this.day,
    required this.date,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double circleSize = constraints.maxWidth * 0.8;

        return Center(
          child: Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: circleSize * 0.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: circleSize * 0.05),
                Text(
                  '$date',
                  style: TextStyle(
                    fontSize: circleSize * 0.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class CalorieProgressBars extends StatelessWidget {
  final double currentCalories;
  final double totalCalories;

  const CalorieProgressBars({
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

class DateItem {
  final String day;
  final String date;
  final double? progress; // Nullable progress field

  DateItem({
    required this.day,
    required this.date,
    this.progress, // Optional progress
  });
}

class DateCircle extends StatelessWidget {
  final DateItem dateItem;

  const DateCircle({Key? key, required this.dateItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Stack(
          alignment: Alignment.center,
          children: [

            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                value: dateItem.progress ?? 0.0, // Default to 0.0 if null
                strokeWidth: 6,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  (dateItem.progress ?? 0.0) == 1.0 ? Colors.green : Colors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateItem.date,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateItem.day,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}