import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_button.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';
import '../../../controller/controllers.dart';
import '../../../utlis/utils.dart';


class WorkoutRoutineScreen extends StatefulWidget {
  WorkoutRoutineScreen({super.key});

  @override
  State<WorkoutRoutineScreen> createState() => _WorkoutRoutineScreenState();
}

class _WorkoutRoutineScreenState extends State<WorkoutRoutineScreen> {
  final WorkoutRoutineController controller = Get.put(WorkoutRoutineController());

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'workout_generate'.tr), // "Workout Generate" translated
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingThree(data: '${'generate_routine_for'.tr} ${'workout'.tr}'), // "Generate your routine for Workout" translated
              SizedBox(height: sizeH * 0.02),

              // TextFields with popup menus for each selection
              buildPopupMenuTextField('Fitness Level?'.tr, controller.selectedFitness, controller.fitnessLevel),
              buildPopupMenuTextField('Where do you train ?'.tr, controller.selectedLocation, controller.trainingLocations),
              buildPopupMenuTextField('How long do you train ?'.tr, controller.selectedDuration, controller.trainingDurations),
              // buildPopupMenuTextField('weekly_frequency'.tr, controller.selectedFrequency, controller.weeklyFrequencies),
            //    buildPopupMenuTextField('training_level'.tr, controller.selectedLevel, controller.trainingLevels),
              buildPopupMenuTextField('Interested in growing a specific muscle'.tr, controller.selectedMuscle, controller.musclesOfInterest),
              buildPopupMenuTextField('Any injuries'.tr, controller.selectedInjury, controller.injuries),

              SizedBox(height: sizeH * 0.02),
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
                    itemCount: controller.days.length,
                    itemBuilder: (context, index) {
                      bool isSelected =  controller.selectedDays.contains(index);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              controller.selectedDays.remove(index); // Deselect day
                            } else {
                              controller.selectedDays.add(index); // Select day
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
                              controller.days[index],
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
              SizedBox(height: sizeH * 0.02),
              // Generate Routine Button
              Center(
                child: CustomTextButton(
                  text: 'generate_routine'.tr, // "Generate Routine" translated
                  onTap: () {
                    // Add functionality here for button tap
                    // _showDisclaimerBottomSheet(context);
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
                              SizedBox(height: 14.h),

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
                                      Get.back();
                                      //   Get.toNamed(RouteNames.bodyFatScreen,preventDuplicates: false);

                                    }, color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );

                  },
                ),
              ),
              SizedBox(height: sizeH * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable PopupMenu within TextField
  Widget buildPopupMenuTextField(String label, RxString selectedValue, List<String> items) {
    final GlobalKey key = GlobalKey();
    return Padding(
      padding:  EdgeInsets.all(5.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp)),
          Obx(
                () => GestureDetector(
              key: key,
              onTap: () async {
                // Get widget's position
                final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
                final position = renderBox.localToGlobal(Offset.zero);

                // Show popup menu aligned to the right
                final value = await showMenu<String>(

                  context: Get.context!,
                  position: RelativeRect.fromLTRB(
                    position.dx + renderBox.size.width - 150,  // Adjust this value for precise alignment
                    position.dy + renderBox.size.height,
                    position.dx + renderBox.size.width,
                    0,
                  ),
                  items: items.map((String item) {
                    return PopupMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                );

                // Set the selected value if user picked an option
                if (value != null) {
                  selectedValue.value = value;
                  print(selectedValue.value);
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: TextEditingController(text: selectedValue.value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Select $label',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.redAccent),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show Bottom Sheet
  void _showDisclaimerBottomSheet(BuildContext context) {
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
              SizedBox(height: 14.h),

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
                      Get.back();
                   //   Get.toNamed(RouteNames.bodyFatScreen,preventDuplicates: false);

                      }, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
