import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../../global widget/global_widget.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utlis/utils.dart';
import '../../../widgets/widgets.dart';
import 'build_pop_up_menu.dart';

class MealInfo extends StatefulWidget {
  const MealInfo({super.key});

  @override
  State<MealInfo> createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {



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
  final List<Map<String, dynamic>> proteinItems = [
    {'icon': AppImages.chicken, 'label': 'Chicken'},
    {'icon':AppImages.beef, 'label': 'Meat'},
    {'icon': AppImages.beef, 'label': 'Pork'},
    {'icon': AppImages.fish, 'label': 'Fish'}, // Replace with a custom fish icon if needed
    {'icon': AppImages.egg, 'label': 'Egg'},  // Replace with a custom egg icon if needed
    {'icon':  AppImages.carrots, 'label': 'Soy'},
  ];
  final Set<int> selectedMeal = {6};
  final Set<int> selectProtien = {6};
  final Set<int> selectCarb = {6};



  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?; // Safely cast arguments
    final int? id = arguments?['id'];
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
       appBar:id != null ? AppBar(title:  CustomText(text: "Meal Generate".tr,fontsize: 18.sp,)):null,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              id != null ? SizedBox(height: 10.h,) : SizedBox(height: 6.h,),

              id != null ? Center(child: CustomText(text: "Generate your routine for Meal".tr,fontsize: 22.sp ,)):SizedBox.shrink(),
              id != null ? SizedBox(height: 20.h,):SizedBox.shrink(),

              ///===============Objective=========================================
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


              CustomText(text: "Which food do you like ?".tr ,),
              ///===============Protien=========================================
              SizedBox(height: 20.h,),
              CustomText(text: "Protien".tr ,fontWeight: FontWeight.w600,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Display 4 days per row
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: proteinItems.length,
                  itemBuilder: (context, index) {
                    final item = proteinItems[index];
                    bool isSelected = selectProtien.contains(index);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectProtien.remove(index); // Deselect day
                          } else {
                            selectProtien.add(index); // Select day
                          }
                        });
                      },
                      child: ProteinCard(
                        iconPath: item['icon'],
                        label: item['label'],
                        textColor: isSelected ?Colors.white:AppColors.textColor,
                        colors:isSelected? AppColors.primaryColor :Colors.white ,

                      ),
                    );
                  },
                ),
              ),
              ///===============Protien=========================================
              SizedBox(height: 20.h,),
              CustomText(text: "Carbs".tr,fontWeight: FontWeight.w600,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Display 4 days per row
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: proteinItems.length,
                  itemBuilder: (context, index) {
                    final item = proteinItems[index];
                    bool isSelected = selectCarb.contains(index);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectCarb.remove(index); // Deselect day
                          } else {
                            selectCarb.add(index); // Select day
                          }
                        });
                      },
                      child: ProteinCard(
                        iconPath: item['icon'],
                        label: item['label'],
                        textColor: isSelected ?Colors.white:AppColors.textColor,
                        colors:isSelected? AppColors.primaryColor :Colors.white ,

                      ),
                    );
                  },
                ),
              ),
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
                text: 'Submit'.tr,
                onTap: () {
                  id != null ?Get.toNamed(RouteNames.bodyFatScreen,  arguments: {'id': id}, preventDuplicates: false):
                  _showDisclaimerBottomSheet(context);
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
class ProteinCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color colors;
  final Color textColor;

  const ProteinCard({required this.iconPath, required this.label, required this.colors, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
  //  final isSelected = _selectedItems.contains(itemName);
    return Container(
      decoration: BoxDecoration(
        color: colors,
        border: Border.all(
            color: AppColors.iconColor),
        borderRadius: BorderRadius.circular(8),
      ),child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 20.w,
            height:20.h
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
