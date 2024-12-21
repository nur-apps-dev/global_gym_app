import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../../global widget/global_widget.dart';
import 'build_pop_up_menu.dart';

class WorkoutInfo extends StatefulWidget {
  const WorkoutInfo({super.key});

  @override
  State<WorkoutInfo> createState() => _WorkoutInfoState();
}

class _WorkoutInfoState extends State<WorkoutInfo> {
  // Selected values for dropdowns in Workout Tab
  String? _selectedTrainingLocation;
  String? _selectedTrainingLevel;
  String? _selectedMuscleGroup;
  String? _selectedTrainingDuration;
  String? _selectedInjuries;
  String? _selectedFrequency;
  final List<String> days = ['Mon'.tr, 'Tue'.tr, 'Wed'.tr, 'Thu'.tr, 'Fri'.tr, 'Sat'.tr, 'Sun'.tr];
  final Set<int> selectedDays = {6};
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .018),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              CustomText(text: "Fitness Level?".tr,),
              SizedBox(height: sizeH * .01),
              buildPopupMenuField(
                ['activity_basic', 'activity_intermediate', 'activity_advanced'],
                selectedValue: _selectedTrainingLevel?.tr,
                hintText: 'Fitness Level?',
                onChanged: (String? value) {
                  setState(() {
                    _selectedTrainingLevel = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomText(text: "Where do you train ?".tr,),
              SizedBox(height: sizeH * .01),
              buildPopupMenuField(
                ['at_home', 'at_gym'],
                selectedValue: _selectedTrainingLocation?.tr,
                hintText: 'Where do you train ?',
                onChanged: (String? value) {
                  setState(() {
                    _selectedTrainingLocation = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomText(text: "How long do you train ?".tr,),
              SizedBox(height: sizeH * .01),

              buildPopupMenuField(
                ['20 minutes', '45 minutes', '60 minutes'],
                selectedValue: _selectedTrainingDuration?.tr,
                hintText: 'How long do you train ?',
                onChanged: (String? value) {
                  setState(() {
                    _selectedTrainingDuration = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomText(text: "Interested in growing a specific muscle".tr,),
              SizedBox(height: sizeH * .01),
              buildPopupMenuField(
                ['general_growth', 'Legs and Glutes', 'back', 'chest', 'shoulders_and_arms', 'Core'],
                selectedValue: _selectedMuscleGroup?.tr,
                hintText: 'Interested in growing a specific muscle',
                fontsize: 12.sp,
                onChanged: (String? value) {
                  setState(() {
                    _selectedMuscleGroup = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomText(text: "Any injuries".tr,),
              SizedBox(height: sizeH * .01),
              buildPopupMenuField(
                ['Lower back', 'knees', 'shoulder (Rotator cuff)', 'no_injuries'],
                selectedValue: _selectedInjuries?.tr,
                hintText: 'Any injuries',
                onChanged: (String? value) {
                  setState(() {
                    _selectedInjuries = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),
              CustomText(text: "How often do you want to train ? (2,3,4,5 days)".tr,),
              SizedBox(height: sizeH * .01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Display 4 days per row
                      childAspectRatio: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedDays.contains(index);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedDays.remove(index); // Deselect day
                            } else {
                              selectedDays.add(index); // Select day
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.red : Colors.white,
                            border: Border.all(
                                color: AppColors.iconColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              days[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: sizeH * .04),

              CustomTextButton(
                color: Colors.grey,
                text: 'submit'.tr,
                onTap: () {
                  // Handle submit action for workout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
