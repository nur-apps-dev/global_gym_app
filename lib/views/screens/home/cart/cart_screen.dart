import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

import '../../../../utlis/app_images.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Set<String> _selectedItems = {}; // Set to keep track of selected items

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title:HeadingTwo(data: 'cart_title'.tr) // "Shopping List" translated

      ),
      body: Padding(
        padding: EdgeInsets.all(sizeW * 0.04),
        child: ListView(
          children: [
            _buildCategorySection('category_meats'.tr, [
              _buildCartItem("Beef", AppImages.beef),
              _buildCartItem("Chicken", AppImages.chicken),
              _buildCartItem("Eggs", AppImages.egg),
              _buildCartItem("Fish", AppImages.fish),
            ]),
            _buildCategorySection('category_dairy'.tr, [
              _buildCartItem("Milk", AppImages.milk),
              _buildCartItem("Curd", AppImages.curd),
              _buildCartItem("Cheese", AppImages.chesse),
              _buildCartItem("Chocolate", AppImages.chocolate),
            ]),
            _buildCategorySection('category_vegetables'.tr, [
              _buildCartItem("Carrots", AppImages.carrots),

              // Add more items here if needed
            ]),
          ],
        ),
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
              'weight_unit'.tr, // "150g" translated
              style: TextStyle(fontSize: sizeH * 0.02),
            ),
            SizedBox(width: sizeW * 0.04),
            Icon(
              Icons.check_circle,
              color: isSelected ? Colors.green : Colors.grey, // Change color based on selection
              size: sizeH * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
