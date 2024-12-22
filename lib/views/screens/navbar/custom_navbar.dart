import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import '../../../utlis/utils.dart';
import '../home/home_screen.dart';
import '../screens.dart';
import '../workout/workout_screen.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => CustomNavbarState();
}

class CustomNavbarState extends State<CustomNavbar> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const WorkoutScreen(),
    const ChatScorpion(),
    const MealPlanScreen(),
    const ProgressScreen(),
  ];
  @override
  void initState() {
    super.initState();
    // Register this state to be found by Get.find<CustomNavbarState>()
    Get.put(this);
  }

  // Method to update the current index from external sources
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: currentIndex == 0 ? Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingThree(data: 'home_hello'.tr, color: AppColors.primaryColor),
            const HeadingThree(data: 'John ✨'),
          ],
        ):null,
        actions: [
          IconButton(onPressed: () {}, icon: AppIcons.fire),
          IconButton(onPressed: () {
            Get.toNamed(RouteNames.cartScreen,preventDuplicates: false);
          }, icon: Icon(Icons.shopping_cart_outlined),),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.profileScreen);
            },
            child: CircleAvatar(
              radius: sizeH * .02,
              backgroundImage: const AssetImage(AppImages.profile),
            ),
          ),
          SizedBox(width: sizeW * .02),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: _buildBottomNavBar(sizeH, sizeW),
    );
  }

  Widget _buildBottomNavBar(double sizeH, double sizeW) {
    return Container(
      height: sizeH * .08,
      margin: EdgeInsets.all(sizeH * .01),
      padding: EdgeInsets.symmetric(horizontal: sizeW * .04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sizeH * .04),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0,true),
          _buildNavItem(Icons.fitness_center, 1, true),
          _buildNavItem(Icons.fitness_center, 2,false),
          _buildNavItem(Icons.restaurant, 3, true),
          _buildNavItem(Icons.show_chart, 4,true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, bool isIcon) {
    final sizeH = MediaQuery.of(context).size.height;
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isIcon == true ?  Icon(icon, color: isSelected ? AppColors.primaryColor : Colors.grey, size: sizeH * .03): SvgPicture.asset( AppIcons.chatIcon,width: 30.w,height: 30.h, colorFilter: ColorFilter.mode(
            isSelected ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),),
          if (isSelected)
            Padding(
              padding: EdgeInsets.only(top: sizeH * .004),
              child: Container(
                height: 3.h,
                width: 25.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
