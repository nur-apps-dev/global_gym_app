import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';
import 'package:gimnasio_escorpion/utlis/app_images.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_button.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

import '../../widgets/widgets.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late VideoPlayerController _controller;
  final TextEditingController repsController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        setState(() {}); // Update the UI after the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    repsController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: HeadingTwo(data: "gymExercise".tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeH * 0.02),
              HeadingTwo(
                  data: 'workoutPlanDay'.tr, color: AppColors.primaryColor),
              SizedBox(height: sizeH * 0.02),

              // Video Player Section with Border Radius and Loading Indicator
              SizedBox(
                height: sizeH * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Set your desired border radius here
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_controller.value.isInitialized)
                        VideoPlayer(_controller)
                      else
                        const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor)),
                      if (_controller.value.isInitialized &&
                          !_controller.value.isPlaying)
                        IconButton(
                          icon: const Icon(Icons.play_arrow,
                              size: 50, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _controller.play();
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeH * 0.02),

              HeadingTwo(data: 'exerciseInstruction'.tr),
              SizedBox(height: sizeH * 0.02),
              HeadingThree(data: 'description'.tr),
              SizedBox(height: sizeH * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingThree(data: 'reps'.tr),
                  Row(
                    children: [
                      const Icon(Icons.repeat),
                      HeadingThree(data: 'sets'.tr)
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteNames.swapScreen);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.swap_calls),
                        HeadingThree(data: 'swapToChange'.tr)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: sizeH * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Workouts".tr,fontsize: 16.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(text: "01:02:09",),
                      SizedBox(width: 4.w,),
                      Icon(Icons.pause_circle_outline_outlined,color: AppColors.primaryColor,)
                    ],
                  ),
                ],
              ),
              SizedBox(height: sizeH * 0.02),
              CustomTextButton(
                  text: '+ Add  Exercise'.tr,
                  color: Color(0xff999999),
                  onTap: () {
                    Get.toNamed(RouteNames.addExercise,preventDuplicates: false);

                  }),
              SizedBox(height: 16.h),
              // Workouts List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeH * .012),
                      child: ListTile(
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(AppImages.workout,
                                  width: sizeW * 0.15),
                            ),
                            Icon(Icons.play_circle,
                                color: Colors.white, size: sizeH * 0.04),
                          ],
                        ),
                        title: HeadingTwo(data: 'pullUp'.tr),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(

                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(16)),
                                child: CustomText(text: "reps".tr,fontsize: 12.sp,),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: HeadingThree(
                                    data: 'sets'.tr,
                                    fontSize: sizeH * .016,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.check_circle,
                                  color: AppColors.primaryColor),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(RouteNames.swapScreen,preventDuplicates: false);
                              },
                              icon: const Icon(Icons.swap_calls),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: sizeH * 0.02),

              // Finish Button
              CustomTextButton(
                  text: 'finishExercise'.tr,
                  onTap: () {
                    _showTrackRepsBottomSheet();
                  }),
              SizedBox(height: sizeH * 0.02),
            ],
          ),
        ),
      ),
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
                  data: 'trackYourBestReps'.tr,
                ),
                SizedBox(height: 8.h),
                Text(
                  'trackBestRepsHint'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [

                    Expanded(
                      child: CustomTextField(
                        controller: repsController,
                        hintText:  '10 Sets'.tr,
                        borderColor: Color(0xff586260),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your Sets'.tr;
                          }
                          return null;

                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomTextField(
                        controller: repsController,
                        hintText:  'reps'.tr,
                        borderColor: Color(0xff586260),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your Reps'.tr;
                          }
                          return null;

                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: weightController,
                  hintText:  'weightKg'.tr,
                  borderColor: Color(0xff586260),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your weight'.tr;
                    }
                    return null;

                  },
                ),

                SizedBox(height: 16.h),
                CustomTextButton(
                    text: 'trackRepsButton'.tr,
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
}
