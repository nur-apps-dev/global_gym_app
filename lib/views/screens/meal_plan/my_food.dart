import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global widget/global_widget.dart';
import '../../../utlis/utils.dart';

// class MyFood extends StatefulWidget {
//   const MyFood({super.key});
//
//   @override
//   State<MyFood> createState() => _MyFoodState();
// }
//
// class _MyFoodState extends State<MyFood> {
//   final Set<String> _selectedItems = {};
//
//   @override
//   Widget build(BuildContext context) {
//     final sizeW = MediaQuery.sizeOf(context).width;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 2.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:  EdgeInsets.all(6.r),
//                 child: CustomTextButton(
//                     text: '+  Add  New Food'.tr,
//                     color: Color(0xff999999),
//                     onTap: () {
//                       //    Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);
//
//                     }),
//               ),
//               Container(
//                 height: 400.h,
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: 6,
//                         itemBuilder: (context, Index) {
//                           return _buildCartItem("Beef", "350 Cal(150g)", AppImages.beef);
//                         },
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding:  EdgeInsets.all(6.r),
//                 child: CustomTextButton(
//                     text: '+  Add  New Food'.tr,
//                     color: Color(0xff999999),
//                     onTap: () {
//                       //    Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);
//
//                     }),
//               ),
//               SizedBox(height: 5.h,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCartItem(String itemName, String weightUnit, String iconPath) {
//     final sizeH = MediaQuery.sizeOf(context).height;
//     final sizeW = MediaQuery.sizeOf(context).width;
//     final isSelected = _selectedItems.contains(itemName);
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (isSelected) {
//             _selectedItems.remove(itemName);
//           } else {
//             _selectedItems.add(itemName);
//           }
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: sizeH * 0.005),
//         child: Row(
//           children: [
//             Image.asset(
//               iconPath,
//               width: sizeW * 0.08,
//               height: sizeH * 0.04,
//             ),
//             SizedBox(width: sizeW * 0.04),
//             Expanded(
//               child: Text(
//                 itemName,
//                 style: TextStyle(fontSize: sizeH * 0.02),
//               ),
//             ),
//             Text(
//               weightUnit, // "150g" translated
//               style: TextStyle(fontSize: sizeH * 0.02),
//             ),
//             SizedBox(width: sizeW * 0.04),
//             Icon(
//               Icons.check_circle,
//               color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
//               size: sizeH * 0.025,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyFood extends StatefulWidget {
  const MyFood({super.key});

  @override
  State<MyFood> createState() => _MyFoodState();
}

class _MyFoodState extends State<MyFood> {
  final Set<String> _selectedItems = {}; // Track selected items
  final List<Map<String, String>> _foodItems = [
    {"name": "Beef", "weightUnit": "350 Cal(150g)", "iconPath": AppImages.beef},
    {"name": "Chicken", "weightUnit": "200 Cal(100g)", "iconPath": AppImages.chicken},
    {"name": "Fish", "weightUnit": "150 Cal(80g)", "iconPath": AppImages.fish},
    {"name": "Eggs", "weightUnit": "70 Cal(50g)", "iconPath": AppImages.egg},
    {"name": "Milk", "weightUnit": "120 Cal(250ml)", "iconPath": AppImages.milk},
    {"name": "Carrots", "weightUnit": "40 Cal(100g)", "iconPath": AppImages.carrots},
  ];

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(6.r),
              //   child: CustomTextButton(
              //     text: '+ Add New Food'.tr,
              //     color: Color(0xff999999),
              //     onTap: () {
              //       // Handle add new food functionality
              //     },
              //   ),
              // ),
              Container(
                height: 400.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _foodItems.length,
                  itemBuilder: (context, index) {
                    final foodItem = _foodItems[index];
                    return _buildCartItem(
                      foodItem["name"]!,
                      foodItem["weightUnit"]!,
                      foodItem["iconPath"]!,
                    );
                  },
                ),
              ),
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
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String itemName, String weightUnit, String iconPath) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    final isSelected = _selectedItems.contains(itemName);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedItems.remove(itemName);
          } else {
            _selectedItems.add(itemName);
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: sizeH * 0.005),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: sizeW * 0.08,
              height: sizeH * 0.04,
            ),
            SizedBox(width: sizeW * 0.04),
            Expanded(
              child: Text(
                itemName,
                style: TextStyle(fontSize: sizeH * 0.02),
              ),
            ),
            Text(
              weightUnit,
              style: TextStyle(fontSize: sizeH * 0.02),
            ),
            SizedBox(width: sizeW * 0.04),
            Icon(
              Icons.check_circle,
              color: isSelected ? Colors.green : Colors.grey,
              size: sizeH * 0.025,
            ),
          ],
        ),
      ),
    );
  }

}
