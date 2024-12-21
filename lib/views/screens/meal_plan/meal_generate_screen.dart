
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global widget/global_widget.dart';
import '../../../routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class MealGenerateScreen extends StatefulWidget {
  const MealGenerateScreen({super.key});

  @override
  State<MealGenerateScreen> createState() => _MealGenerateScreenState();
}

class _MealGenerateScreenState extends State<MealGenerateScreen> {

  String? _selectedObjective;
  String? _selectedDiet;
  String? _selectedGoal;
  String? _selectedFoodPreferences;
  TextEditingController _currentHeightController = TextEditingController();
  String? _selectedLbsKgLevel;
  final List<String> protiens = [
    "Lean minced meat".tr,
    "Churrasco de rump".tr,
    "Entrails".tr,
    "Tri Tip".tr,
    "Ribs".tr,
    "Flap".tr,
    "Picanha".tr,
    "Back".tr,
    "Rib eye".tr,
    "Sirloin Steak/Chorizo Steak".tr,
    "Vacuum steak".tr,
    "Chicken (skinless breast)".tr,
    "Chicken (legs)".tr,
    "Pork (loin)".tr,
    "Pork (Ribs)".tr,
    "Salmon (raw)".tr,
    "Tuna (raw)".tr,
    "Hake (raw)".tr,
    "Sardine".tr,
    "Egg (whole)".tr,
    "Egg whites".tr,
    "Tofu".tr,
    "Seitan".tr,
    "Whey".tr,
    "Soy".tr,
    "Lentils".tr,
    "Chickpeas".tr];
  final List<String> meals = ['Breakfast'.tr, 'Snack'.tr, 'Lunch'.tr, 'Evening meal'.tr, 'Dinner'.tr,];
  final Set<int> selectedMeal = {6};



  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Meal Generate".tr,fontsize: 18.sp,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .018),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Center(child: CustomText(text: "Generate your routine for Meal".tr,fontsize: 20.sp,fontWeight: FontWeight.w700,)),
              ///===============Objective=========================================
              SizedBox(height: sizeH * .01),
              CustomText(text: "Objective".tr ,),
              SizedBox(height: sizeH * .01),
              buildPopupMenuField(
                ['Lean', 'Bulk'],
                selectedValue: _selectedObjective?.tr,
                hintText: 'Objective',
                onChanged: (String? value) {
                  setState(() {
                    _selectedObjective = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),



              ///===============Which meals do you do a day?=========================================
              CustomText(text: "Which meals do you do a day?".tr ,),
              SizedBox(height: sizeH * .01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Display 4 days per row
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedMeal.contains(index);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedMeal.remove(index); // Deselect day
                            } else {
                              selectedMeal.add(index); // Select day
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
                              meals[index],
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
              SizedBox(height: sizeH * .02),



              ///===============Which meals do you do a day?=========================================
              CustomText(text: "What is your current Weight? ".tr ,),
              SizedBox(height: sizeH * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextField
                  Expanded(
                    child: CustomTextField(
                      controller: _currentHeightController,
                      hintText: "176".tr,
                      borderColor: AppColors.textFieldBorderColor,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'current Weight?'.tr;
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(width: 8.w), // Spacer between TextField and Dropdown
                  Expanded(
                    child: buildPopupMenuField(
                      ['lbs','kg'],
                      selectedValue: _selectedLbsKgLevel?.tr,
                      hintText: 'lbs',
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLbsKgLevel = value;
                        });
                      },
                    ),
                  ),
                  // DropdownButton

                ],
              ),
              SizedBox(height: sizeH * .02),



              ///===============What is your objective  Weight? =========================================
              CustomText(text: "What is your objective Weight? ".tr ,),
              SizedBox(height: sizeH * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextField
                  Expanded(
                    child: CustomTextField(
                      controller: _currentHeightController,
                      hintText: "176".tr,
                      borderColor: AppColors.textFieldBorderColor,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'objective Weight?'.tr;
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(width: 8.w), // Spacer between TextField and Dropdown
                  Expanded(
                    child: buildPopupMenuField(
                      ['lbs','kg'],
                      selectedValue: _selectedLbsKgLevel?.tr,
                      hintText: 'lbs',
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLbsKgLevel = value;
                        });
                      },
                    ),
                  ),
                  // DropdownButton

                ],
              ),
              SizedBox(height: sizeH * .02),

              ///===============Which food do you like ? =========================================
              CustomText(text: "Which food do you like ?".tr ,),



              // buildPopupMenuField(
              //   ['no_restrictions', 'vegan', 'vegetarian', 'keto', 'low_carb'],
              //   selectedValue: _selectedDiet?.tr,
              //   hintText: 'hint_diet',
              //   onChanged: (String? value) {
              //     setState(() {
              //       _selectedDiet = value;
              //     });
              //   },
              // ),
              // SizedBox(height: sizeH * .02),
              //
              // buildPopupMenuField(
              //   ['bulking', 'cutting', 'maintenance'],
              //   selectedValue: _selectedGoal?.tr,
              //   hintText: 'hint_goal',
              //   onChanged: (String? value) {
              //     setState(() {
              //       _selectedGoal = value;
              //     });
              //   },
              // ),
              // SizedBox(height: sizeH * .02),
              //
              // buildPopupMenuField(
              //   ['protein', 'carbs', 'fat'],
              //   selectedValue: _selectedFoodPreferences?.tr,
              //   hintText: 'hint_food_preferences',
              //   onChanged: (String? value) {
              //     setState(() {
              //       _selectedFoodPreferences = value;
              //     });
              //   },
              // ),
              SizedBox(height: sizeH * .04),

              CustomTextButton(
                text: 'Next'.tr,
                onTap: () {
                  Get.toNamed(RouteNames.bodyFatScreen,preventDuplicates: false);
                //  _showDisclaimerBottomSheet(context);
                },
              ),
              SizedBox(height: sizeH * .01),
            ],
          ),
        ),
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
                    child: CustomTextButton(text: 'agree'.tr, onTap: (){Get.toNamed(RouteNames.bodyFatScreen,preventDuplicates: false);}, color: Colors.green),
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

