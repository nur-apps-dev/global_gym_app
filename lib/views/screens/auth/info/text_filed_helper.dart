import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextField({required TextEditingController controller, required String hintText, TextInputType keyboardType = TextInputType.text}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),

        hintText: hintText, // Use the passed hint text here
        hintMaxLines: 1,
        hintStyle: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black.withOpacity(0.4))
    ),
  );
}