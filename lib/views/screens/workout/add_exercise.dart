
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

import '../../../global widget/custom_button.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';


class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final List<String> _workouts = [
    'pullUp'.tr,
    'pushUp'.tr,
    'squat'.tr,
    'deadlift'.tr,
    'benchPress'.tr,
    'lunges'.tr,
    'plank'.tr,
    'burpees'.tr,
    'jumpRope'.tr,
    'mountainClimbers'.tr,
  ];

  List<String> _filteredWorkouts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredWorkouts = _workouts;
    _searchController.addListener(_filterWorkouts);
  }

  void _filterWorkouts() {
    setState(() {
      _filteredWorkouts = _workouts
          .where((workout) => workout
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:
        HeadingTwo(data: 'Add Exercise'.tr), // "Swap exercise" translated
      ),
      body:Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed Search Bar and Button
              Padding(
                padding: EdgeInsets.all(sizeH * .025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingThree(data: "search_workout".tr),
                    SizedBox(height: sizeH * 0.02),
                    CustomTextField(
                      controller: _searchController,
                      hintText: 'Push Ups'.tr,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 12.w),
                        child: Icon(Icons.search_rounded, color: AppColors.primaryColor),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Push Ups'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: sizeH * 0.02),
                    CustomTextButton(
                      text: 'Add Exercise'.tr,
                      onTap: () {
                        // Handle button press
                      },
                    ),
                  ],
                ),
              ),

              // Scrollable List
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredWorkouts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.h),
                      child: Card(
                        color: Colors.white.withOpacity(0.5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: sizeH * .01),
                          child: ListTile(
                            onTap: () {
                              Get.back();
                            },
                            leading:  ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(AppImages.workout,
                                  width: sizeW * 0.16),
                            ),
                            // Stack(
                            //   alignment: Alignment.center,
                            //   children: [
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.circular(12.0),
                            //       child: Image.asset(AppImages.workout,
                            //           width: sizeW * 0.15),
                            //     ),
                            //     Icon(Icons.play_circle,
                            //         color: Colors.white, size: sizeH * 0.04),
                            //   ],
                            // ),
                            title: HeadingTwo(data: _filteredWorkouts[index]),
                            subtitle: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 30.h,),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Center(
                                        child: HeadingThree(
                                          data: 'reps'.tr,
                                          fontSize: sizeH * .016,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Center(
                                        child: HeadingThree(
                                          data: 'sets'.tr,
                                          fontSize: sizeH * .016,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.check_circle,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.all(sizeH * .025),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(height: sizeH * 0.02),
      //         HeadingThree(
      //             data: "search_workout"
      //                 .tr), // "Search the workout you want to swap" translated
      //         SizedBox(height: sizeH * 0.02),
      //         Padding(
      //           padding: EdgeInsets.only(bottom: 16.h),
      //           child: CustomTextField(
      //             controller: _searchController,
      //             hintText:  'Push Ups'.tr,
      //             suffixIcon: Padding(
      //               padding: EdgeInsets.only(left: 16.w, right: 12.w),
      //               child: Icon(Icons.search_rounded,color: AppColors.primaryColor,),
      //             ),
      //             validator: (value){
      //               if(value == null || value.isEmpty){
      //                 return 'Please enter your Push Ups'.tr;
      //               }
      //               return null;
      //
      //             },
      //           ),
      //         ),
      //         SizedBox(height: sizeH * 0.02),
      //         // Filtered Workouts List
      //         ListView.builder(
      //           physics: const NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //           itemCount: _filteredWorkouts.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               color: Colors.white.withOpacity(0.5),
      //               child: Padding(
      //                 padding: EdgeInsets.symmetric(vertical: sizeH * .01),
      //                 child: ListTile(
      //                   onTap: () {
      //                     Get.back();
      //                   },
      //                   leading: Stack(
      //                     alignment: Alignment.center,
      //                     children: [
      //                       ClipRRect(
      //                         borderRadius: BorderRadius.circular(12.0),
      //                         child: Image.asset(AppImages.workout,
      //                             width: sizeW * 0.15),
      //                       ),
      //                       Icon(Icons.play_circle,
      //                           color: Colors.white, size: sizeH * 0.04),
      //                     ],
      //                   ),
      //                   title: HeadingTwo(data: _filteredWorkouts[index]),
      //                   subtitle: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Expanded(
      //                         child: Container(
      //                           decoration: BoxDecoration(
      //                             color: Colors.transparent,
      //                             border:
      //                                 Border.all(color: AppColors.primaryColor),
      //                             borderRadius: BorderRadius.circular(16),
      //                           ),
      //                           child: Padding(
      //                             padding:
      //                                 EdgeInsets.symmetric(horizontal: 3.w),
      //                             child: Center(
      //                               child: HeadingThree(
      //                                 data: 'reps'.tr, // "Reps" translated
      //                                 fontSize: sizeH * .016,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(width: 5.w),
      //                       Expanded(
      //                         child: Container(
      //                           decoration: BoxDecoration(
      //                             color: Colors.transparent,
      //                             border:
      //                                 Border.all(color: AppColors.primaryColor),
      //                             borderRadius: BorderRadius.circular(16),
      //                           ),
      //                           child: Padding(
      //                             padding:
      //                                 EdgeInsets.symmetric(horizontal: 3.w),
      //                             child: Center(
      //                               child: HeadingThree(
      //                                 data: 'sets'.tr, // "Sets" translated
      //                                 fontSize: sizeH * .016,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   trailing: IconButton(
      //                     onPressed: () {},
      //                     icon: const Icon(Icons.check_circle,
      //                         color: AppColors.primaryColor),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //         CustomTextButton(
      //             text: 'trackRepsButton'.tr,
      //             onTap: () {
      //
      //               // Get.back();
      //               // Get.back();
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
