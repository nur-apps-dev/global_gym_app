import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

import '../../../../global widget/global_widget.dart';
import '../../../../utlis/app_images.dart';
import '../../../widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Set<String> _selectedItems = {}; // Set to keep track of selected items
  final List<Map<String, dynamic>> proteinItems = [
    {'icon': AppImages.chicken, 'label': 'Chicken'},
    {'icon':AppImages.beef, 'label': 'Meat'},
    {'icon': AppImages.beef, 'label': 'Pork'},
    {'icon': AppImages.fish, 'label': 'Fish'}, // Replace with a custom fish icon if needed
    {'icon': AppImages.egg, 'label': 'Egg'},  // Replace with a custom egg icon if needed
    {'icon':  AppImages.carrots, 'label': 'Soy'},
  ];
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title:HeadingTwo(data: 'cart_title'.tr) // "Shopping List" translated

      ),
      body: Padding(
        padding: EdgeInsets.all(sizeW * 0.04),
        child:   SingleChildScrollView(
          child: Column(
            children: [
              ///==============================='Meats, Poultry, and Fish'==================================
              Container(
                height: 300.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
          
                    CustomText(text: 'Meats, Poultry, and Fish'.tr,fontsize: 16,fontWeight: FontWeight.w700,),
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: proteinItems.length,
                        itemBuilder: (context, Index) {
                          final isSelected = _selectedItems.contains(proteinItems[Index]["label"]);
                          return  GestureDetector(
                            onTap: ()   {
                              setState(() {
                                if (isSelected) {
                                  _selectedItems.remove(proteinItems[Index]["label"]);
                                } else {
                                  _selectedItems.add(proteinItems[Index]["label"]);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("${proteinItems[Index]["icon"]}",height: 30.h,width: 30.w,),
                                CustomText(text: "${proteinItems[Index]["label"]}",fontsize: 18.sp,),
                                SizedBox(width: 8.w,),
                                CustomText(text: "350 Cal(150g)",),
                                Icon(
                                  Icons.check_circle,
                                  color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
                                  size:25.sp,
                                ),
                                IconButton(
                                  onPressed: () {
          
                                  },
                                  icon: const Icon(Icons.delete,   color: Color(0xff999999),),
                                ),
                              ],
                            ),
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
                            //   Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);
          
                          }),
                    ),
          
                    ///==============================='Dairy and Cold Cuts'==================================
                  ],
                ),
              ),
              ///==============================='Dairy and Cold Cuts'==================================
              Container(
                height: 300.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
          
                    CustomText(text: 'Dairy and Cold Cuts'.tr,fontsize: 16,fontWeight: FontWeight.w700,),
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: proteinItems.length,
                        itemBuilder: (context, Index) {
                          final isSelected = _selectedItems.contains(proteinItems[Index]["label"]);
                          return  GestureDetector(
                            onTap: ()   {
                              setState(() {
                                if (isSelected) {
                                  _selectedItems.remove(proteinItems[Index]["label"]);
                                } else {
                                  _selectedItems.add(proteinItems[Index]["label"]);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("${proteinItems[Index]["icon"]}",height: 30.h,width: 30.w,),
                                CustomText(text: "${proteinItems[Index]["label"]}",fontsize: 18.sp,),
                                SizedBox(width: 10.w,),
                                CustomText(text: "350 Cal(150g)",),
                                Icon(
                                  Icons.check_circle,
                                  color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
                                  size:25.sp,
                                ),
                                IconButton(
                                  onPressed: () {
          
                                  },
                                  icon: const Icon(Icons.delete,   color: Color(0xff999999),),
                                ),
                              ],
                            ),
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
                            //   Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);
          
                          }),
                    ),
          
                    ///==============================='Dairy and Cold Cuts'==================================
                  ],
                ),
              ),
              ///==============================='Vegetables'==================================
              Container(
                height: 300.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
          
                    CustomText(text: 'Vegetables'.tr,fontsize: 16,fontWeight: FontWeight.w700,),
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: proteinItems.length,
                        itemBuilder: (context, Index) {
                          final isSelected = _selectedItems.contains(proteinItems[Index]["label"]);
                          return  GestureDetector(
                            onTap: ()   {
                              setState(() {
                                if (isSelected) {
                                  _selectedItems.remove(proteinItems[Index]["label"]);
                                } else {
                                  _selectedItems.add(proteinItems[Index]["label"]);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("${proteinItems[Index]["icon"]}",height: 30.h,width: 30.w,),
                                CustomText(text: "${proteinItems[Index]["label"]}",fontsize: 18.sp,),
                                SizedBox(width: 10.w,),
                                CustomText(text: "350 Cal(150g)",),
                                Icon(
                                  Icons.check_circle,
                                  color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
                                  size:25.sp,
                                ),
                                IconButton(
                                  onPressed: () {
          
                                  },
                                  icon: const Icon(Icons.delete,   color: Color(0xff999999),),
                                ),
                              ],
                            ),
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
                            //   Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);
          
                          }),
                    ),
          
                    ///==============================='Dairy and Cold Cuts'==================================
                  ],
                ),
              ),
            ],
          ),
        ),
        // ListView(
        //   children: [
        //     _buildCategorySection('category_meats'.tr, [
        //       _buildCartItem("Beef", AppImages.beef),
        //       _buildCartItem("Chicken", AppImages.chicken),
        //       _buildCartItem("Eggs", AppImages.egg),
        //       _buildCartItem("Fish", AppImages.fish),
        //     ]
        //     ),
        //     _buildCategorySection('category_dairy'.tr, [
        //       _buildCartItem("Milk", AppImages.milk),
        //       _buildCartItem("Curd", AppImages.curd),
        //       _buildCartItem("Cheese", AppImages.chesse),
        //       _buildCartItem("Chocolate", AppImages.chocolate),
        //     ]),
        //     _buildCategorySection('category_vegetables'.tr, [
        //       _buildCartItem("Carrots", AppImages.carrots),
        //
        //       // Add more items here if needed
        //     ]),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildCategorySection(String categoryTitle, List<Widget> items) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: TextStyle(fontSize: MediaQuery.sizeOf(context).height * 0.025, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          ...items,
        ],
      ),
    );
  }

  Widget _buildCartItem(String itemName, String iconPath) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    final isSelected = _selectedItems.contains(itemName);

    return GestureDetector(
      onTap: ()   {
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
        child: Column(
          children: [
            Row(
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
                  'weight_unit'.tr, // "150g" translated
                  style: TextStyle(fontSize: sizeH * 0.02),
                ),
                SizedBox(width: sizeW * 0.04),
                Icon(
                  Icons.check_circle,
                  color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
                  size: sizeH * 0.025,
                ),
                SizedBox(width: sizeW * 0.04),
                Icon(
                  Icons.delete,
                  color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
                  size: sizeH * 0.025,
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(6.r),
              child: CustomTextButton(
                  text: '+ Add New Food'.tr,
                  color: Color(0xff999999),
                  onTap: () {
                   // Get.toNamed(RouteNames.foodAddScreen,preventDuplicates: false);

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
