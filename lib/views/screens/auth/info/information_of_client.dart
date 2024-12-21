import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../../utlis/utils.dart';
import '../../screens.dart';

class InformationOfClient extends StatefulWidget {
  const InformationOfClient({super.key});

  @override
  _InformationOfClientState createState() => _InformationOfClientState();
}

class _InformationOfClientState extends State<InformationOfClient> with SingleTickerProviderStateMixin {





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
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Information".tr,fontsize: 18.sp,),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor:AppColors.primaryColor,
          unselectedLabelColor: Colors.black54,
          labelStyle:  TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w600,fontSize: 16.sp),
          tabs: [
            Tab(text: 'basic_info'.tr,),
            Tab(text: 'Workout'.tr),
            Tab(text: 'Meal Plan'.tr),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BasicInfo(),
          WorkoutInfo(),
          MealInfo(),
        ],
      ),
    );
  }










}
