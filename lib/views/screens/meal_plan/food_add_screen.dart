
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../global widget/global_widget.dart';
import '../../../utlis/utils.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

// class FoodAddScreen extends StatefulWidget {
//    FoodAddScreen({super.key});
//
//   @override
//   State<FoodAddScreen> createState() => _FoodAddScreenState();
// }
//
// class _FoodAddScreenState extends State<FoodAddScreen> with SingleTickerProviderStateMixin {
// TextEditingController _searchController = TextEditingController();
//
//    late TabController _tabController;
//
//    @override
//    void initState() {
//      super.initState();
//      _tabController = TabController(length: 3, vsync: this); // Initialize with 3 tabs
//    }
//
//    @override
//    void dispose() {
//      _tabController.dispose();
//      super.dispose();
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Food".tr,),
//       bottom: TabBar(
//         controller: _tabController,
//         indicatorColor:AppColors.primaryColor,
//         unselectedLabelColor: Colors.black54,
//         labelStyle:  TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w600,fontSize: 16.sp),
//         tabs: [
//           Tab(text: 'My Food'.tr,),
//           Tab(text: 'My recipe'.tr),
//           Tab(text: 'Search food'.tr),
//         ],
//       ),
//       ),
//       body: Container(
//         height: Get.height,
//         width: double.infinity,
//         child: Padding(
//           padding:  EdgeInsets.symmetric(horizontal: 20.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20.h,),
//               Row(
//             children: [
//               // Search Bar Container
//               Expanded(
//                 child: Container(
//                   height: 50,
//
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: CustomTextField(
//                           controller: _searchController,
//                           hintText: 'Search your food'.tr,
//                           suffixIcon: Padding(
//                             padding: EdgeInsets.only(left: 16.w, right: 12.w),
//                             child: Icon(Icons.search_rounded, color: AppColors.primaryColor),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Search your food'.tr;
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8), // Spacing between search bar and button
//               // Menu Icon Button
//               Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                       color: AppColors.primaryColor
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: Icon(
//                     Icons.more_vert,
//                     color: Colors.redAccent,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//               SizedBox(height: 20.h,),
//               TabBarView(
//                 controller: _tabController,
//                 children: const [
//                   Text("data"),
//                   Text("data"),
//                   Text("data"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//
//     );
//
//   }
// }


class FoodAddScreen extends StatefulWidget {
  FoodAddScreen({super.key});

  @override
  State<FoodAddScreen> createState() => _FoodAddScreenState();
}

class _FoodAddScreenState extends State<FoodAddScreen>
    with SingleTickerProviderStateMixin {

  final Set<String> _selectedItems = {}; // Track selected items
  final List<Map<String, String>> _foodItems = [
    {"name": "Beef", "weightUnit": "350 Cal(150g)", "iconPath": AppImages.beef},
    {"name": "Chicken", "weightUnit": "200 Cal(100g)", "iconPath": AppImages.chicken},
    {"name": "Fish", "weightUnit": "150 Cal(80g)", "iconPath": AppImages.fish},
    {"name": "Eggs", "weightUnit": "70 Cal(50g)", "iconPath": AppImages.egg},
    {"name": "Milk", "weightUnit": "120 Cal(250ml)", "iconPath": AppImages.milk},
    {"name": "Carrots", "weightUnit": "40 Cal(100g)", "iconPath": AppImages.carrots},
  ];




  TextEditingController _searchController = TextEditingController();
  TextEditingController _nameTEController = TextEditingController();
  TextEditingController _recipeNameTEController = TextEditingController();
  TextEditingController _savingWeightController = TextEditingController();
  TextEditingController _caloriesController = TextEditingController();
  TextEditingController _carbsController = TextEditingController();
  TextEditingController _protineController = TextEditingController();
  TextEditingController _fateController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Initialize with 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Food".tr,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.black54,
          labelStyle: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
          tabs: [
            Tab(
              text: 'My Food'.tr,
            ),
            Tab(
              text: 'My recipe'.tr,
            ),
            Tab(
              text: 'Search food'.tr,
            ),
          ],
        ),
      ),
      body: Container(
        height: Get.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  // Search Bar Container
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _searchController,
                              hintText: 'Search your food'.tr,
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(left: 16.w, right: 12.w),
                                child: Icon(Icons.search_rounded,
                                    color: AppColors.primaryColor),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Search your food'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Spacing between search bar and button
                  // Menu Icon Button
///================Create Food / and Recipe====================================================
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, color: Colors.black), // 3-dot icon
                      onSelected: (value) {
                        if (value == 'create_food') {
                          ///===========================Create Food showModalBottomSheet================================
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // Makes bottom sheet full height if needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.all(20.w),
                                child: SingleChildScrollView( // Wrap the content in a scrollable view
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Drag Handle
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          height: 4.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Create Food'.tr,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),

                                      /// Name Field
                                      CustomText(text: "Name".tr, fontsize: 18.sp),
                                      SizedBox(height: 5.h),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 16.h),
                                        child: CustomTextField(
                                          controller: _nameTEController,
                                          hintText: "Name".tr,
                                          borderColor: AppColors.buttonColor,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Name'.tr;
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      /// ExpansionTile
                                      Card(
                                        color: Colors.white.withOpacity(0.8),
                                        child: ExpansionTile(
                                          title: Row(
                                            children: [
                                              CustomText(
                                                text: "Category".tr,
                                                fontsize: 16.sp,
                                              ),
                                            ],
                                          ),
                                          children: [
                                            Container(
                                              height: 300.h,
                                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Divider(),
                                                  ///=================Serving weight===========================
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Serving weight".tr,
                                                        fontsize: 18.sp,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      SizedBox(
                                                        width: 150.w, // Set fixed width for the text field
                                                        height: 35.h, // Set reduced height for the text field
                                                        child: CustomTextField(
                                                          hintextSize: 12.sp,
                                                          controller: _savingWeightController,
                                                          hintText: "Serving weight".tr,
                                                          borderColor: AppColors.buttonColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  ///=================Calories===========================
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Calories".tr,
                                                        fontsize: 18.sp,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      SizedBox(
                                                        width: 150.w, // Set fixed width for the text field
                                                        height: 35.h, // Set reduced height for the text field
                                                        child: CustomTextField(
                                                          hintextSize: 12.sp,
                                                          controller: _caloriesController,
                                                          hintText: "Calories".tr,
                                                          borderColor: AppColors.buttonColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  ///=================Carbs===========================
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Carbs".tr,
                                                        fontsize: 18.sp,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      SizedBox(
                                                        width: 150.w, // Set fixed width for the text field
                                                        height: 35.h, // Set reduced height for the text field
                                                        child: CustomTextField(
                                                          hintextSize: 12.sp,
                                                          controller: _carbsController,
                                                          hintText: "Carbs".tr,
                                                          borderColor: AppColors.buttonColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  ///=================Protine===========================
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Protine".tr,
                                                        fontsize: 18.sp,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      SizedBox(
                                                        width: 150.w, // Set fixed width for the text field
                                                        height: 35.h, // Set reduced height for the text field
                                                        child: CustomTextField(
                                                          hintextSize: 12.sp,
                                                          controller: _protineController,
                                                          hintText: "Protine".tr,
                                                          borderColor: AppColors.buttonColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  ///=================Fat===========================
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Fat".tr,
                                                        fontsize: 18.sp,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      SizedBox(
                                                        width: 150.w, // Set fixed width for the text field
                                                        height: 35.h, // Set reduced height for the text field
                                                        child: CustomTextField(
                                                          hintextSize: 12.sp,
                                                          controller: _fateController,
                                                          hintText: "Fat".tr,
                                                          borderColor: AppColors.buttonColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      SizedBox(height: 20.h),

                                      /// Buttons
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: CustomTextButton(
                                              text: 'cancel'.tr,
                                              onTap: () {
                                                Get.back();
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: CustomTextButton(
                                              text: 'agree'.tr,
                                              onTap: () {
                                                Get.back();
                                              },
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                        } else if (value == 'create_recipe') {
                          ///===========================Create Food showModalBottomSheet================================

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, modalSetState) {
                                  return Padding(
                                    padding: EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [

                                          // Drag Handle
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              height: 4,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              'Create Recipe'.tr,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          SizedBox(height: 10),

                                          SizedBox(height: 10.h),

                                          /// Name Field
                                          CustomText(text: "Name".tr, fontsize: 18.sp),
                                          SizedBox(height: 5.h),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 16.h),
                                            child: CustomTextField(
                                              controller: _recipeNameTEController,
                                              hintText: "Name".tr,
                                              borderColor: AppColors.buttonColor,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Name'.tr;
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          /// ExpansionTile
                                          Card(
                                            color: Colors.white.withOpacity(0.8),
                                            child: ExpansionTile(
                                              title: Row(
                                                children: [
                                                  Text(
                                                    "Category",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                SizedBox(
                                                  height: 200,
                                                  child: ListView.builder(
                                                    itemCount: _foodItems.length,
                                                    itemBuilder: (context, index) {
                                                      final foodItem = _foodItems[index];
                                                      final isSelected = _selectedItems.contains(foodItem["name"]);
                                                      return GestureDetector(
                                                        onTap: () {
                                                          modalSetState(() {
                                                            // Update local state in the modal
                                                            if (isSelected) {
                                                              _selectedItems.remove(foodItem["name"]);
                                                            } else {
                                                              _selectedItems.add(foodItem["name"]!);
                                                            }
                                                          });
                                                          // Also persist the state in the parent widget
                                                          setState(() {});
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                foodItem["iconPath"]!,
                                                                width: 40,
                                                                height: 40,
                                                              ),
                                                              SizedBox(width: 10),
                                                              Expanded(
                                                                child: Text(
                                                                  foodItem["name"]!,
                                                                  style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                                    color: isSelected ? Colors.green : Colors.black,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                foodItem["weightUnit"]!,
                                                                style: TextStyle(fontSize: 14),
                                                              ),
                                                              SizedBox(width: 10),
                                                              Icon(
                                                                Icons.check_circle,
                                                                color: isSelected ? Colors.green : Colors.grey,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          Padding(
                                            padding: EdgeInsets.all(6.r),
                                            child: CustomTextButton(
                                              text: 'Add In Breakfast'.tr,
                                              color: AppColors.primaryColor,
                                              onTap: () {
                                                // Handle add new food functionality
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );


                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(

                          value: 'create_food',
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Create Food'),
                              Icon(Icons.rice_bowl_outlined, color: Colors.grey),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'create_recipe',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Create Recipe'),
                              Icon(Icons.restaurant_menu, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // Wrap TabBarView in Expanded
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    MyFood(),
                    MyRecipe(),
                    Center(child: Text("Search Food Content")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

