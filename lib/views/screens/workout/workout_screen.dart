import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_button.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_card.dart';
import 'package:gimnasio_escorpion/helpers/helpers.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/utlis/app_colors.dart';
import 'package:gimnasio_escorpion/utlis/app_images.dart';
import 'package:gimnasio_escorpion/utlis/custom_text_style.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int activeWeek = 1; // Tracks the active week
  List<String> items = List.generate(6, (index) => "Item $index");

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
  final String time = '1 hr 15 min'.tr;
  final bool isComplete = true;
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizeW * 0.04,
            vertical: sizeH * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout header card
              Padding(
                padding: EdgeInsets.only(bottom: sizeH * 0.02),
                child: CustomCard(
                  img: AppImages.workout,
                  title: 'home_workout'.tr,
                  buttonText: 'home_workout_btn'.tr,
                  onTap: () {
                    Get.toNamed(RouteNames.workoutRoutineScreen);
                  },
                ),
              ),

              // Section heading
              HeadingTwo(data: 'your_workout_plan'.tr),

              // Week selection row with styling for active week
              Padding(
                padding: EdgeInsets.symmetric(vertical: sizeH * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    int weekNumber = index + 1;
                    bool isActive = activeWeek == weekNumber;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          activeWeek = weekNumber;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeW * 0.03, vertical: sizeH * 0.01),
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Text(
                          'week $weekNumber'.tr,
                          style: TextStyle(
                            fontSize: sizeW * 0.035,
                            color: isActive ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              ///Exercise======================
              Container(
                height: sizeH * 0.379, child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeW * 0.02),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(RouteNames.exerciseScreen,preventDuplicates: false);
                          },
                        child: Slidable(
                    ///left icon=============================

                          startActionPane: ActionPane(motion: StretchMotion(), children: [
                            SizedBox(width: 20.w,),
                            SlidableAction(onPressed: ((context){
                        //call action method
                      }),
                              borderRadius: BorderRadius.circular(8.r),
                              backgroundColor: Colors.green,
                              icon:Icons.pin_drop_rounded,

                            ),
                            SizedBox(width: 4.w,),
                          ],
                          ),
                    ///right icon==========================

                          endActionPane: ActionPane(motion: StretchMotion(),  children: [

                            SizedBox(width: 4.w,),

                            SlidableAction(onPressed: ((context){
                              //call action method
                              _deleteItem(index);
                              ToastMessageHelper.errorMessageShowToster("Delete item");
                              }),

                              borderRadius: BorderRadius.circular(12.r),
                        backgroundColor: Colors.red,
                        icon:Icons.delete,
                      ),
                            SizedBox(width: 20.w,),
                    ]),

                    child: Container(
                      padding: EdgeInsets.all(sizeW * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeW * 0.03),
                        border: Border.all(color: Colors.red, width: sizeW * 0.005),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(AppImages.workout,
                                width: sizeW * 0.14),
                          ),
                          SizedBox(width: 6.w,),
                          // Column with two texts: "Workout Plan for" and `day` in red
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingThree(data: 'workout_plan_for'.tr),
                              SizedBox(height: 10.h,),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: sizeW * 0.03, vertical: sizeH * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.primaryColor),
                                ),
                                child: Text(
                                  '$time'.tr,
                                  style: TextStyle(
                                    fontSize: sizeW * 0.035,
                                    color:  Colors.black,
                                  ),
                                ),
                              ),
                              //  HeadingThree(data: day, color: AppColors.primaryColor),
                            ],
                          ),
                          SizedBox(
                            width: sizeW * 0.30,
                            child: CustomTextButton(
                              padding: sizeH*.01,
                              text: isComplete ? 'Exercise'.tr : 'incomplete'.tr,
                              onTap: () {
                                // Handle button press
                                Get.toNamed(RouteNames.exerciseScreen,preventDuplicates: false);
                              },
                              color: isComplete ? AppColors.primaryColor : Colors.grey,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            // );
          },
        ),
        ),

            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutPlanCard extends StatelessWidget {
  final String time;
  final bool isComplete;

  const WorkoutPlanCard({required this.time, required this.isComplete, super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeW * 0.02),
      child: InkWell(
        onTap: (){
          Get.toNamed(RouteNames.exerciseScreen);
        },
        child: Slidable(
          ///left icon=============================
          startActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(onPressed: ((context){
              //call action method
            }),
            borderRadius: BorderRadius.circular(8.r),
            backgroundColor: Colors.green,
            icon:Icons.pin_drop_rounded,
            )
          ]),
          ///right icon==========================
           endActionPane: ActionPane(motion: StretchMotion(), children: [
             SlidableAction(onPressed: ((context){
               //call action method
             }),
               borderRadius: BorderRadius.circular(12.r),
               backgroundColor: Colors.blueGrey,
               icon:Icons.delete,
             )
           ]),

          child: Container(
            padding: EdgeInsets.all(sizeW * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW * 0.03),
              border: Border.all(color: Colors.red, width: sizeW * 0.005),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(AppImages.workout,
                      width: sizeW * 0.14),
                ),
                SizedBox(width: 6.w,),
                // Column with two texts: "Workout Plan for" and `day` in red
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingThree(data: 'workout_plan_for'.tr),
                    SizedBox(height: 10.h,),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeW * 0.03, vertical: sizeH * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: Text(
                        '$time'.tr,
                        style: TextStyle(
                          fontSize: sizeW * 0.035,
                          color:  Colors.black,
                        ),
                      ),
                    ),
                  //  HeadingThree(data: day, color: AppColors.primaryColor),
                  ],
                ),
                SizedBox(
                  width: sizeW * 0.30,
                  child: CustomTextButton(
                    padding: sizeH*.01,
                    text: isComplete ? 'Exercise'.tr : 'incomplete'.tr,
                    onTap: () {
                      // Handle button press
                      Get.toNamed(RouteNames.exerciseScreen,preventDuplicates: false);
                    },
                    color: isComplete ? AppColors.primaryColor : Colors.grey,
          
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<String> items = List.generate(10, (index) => "Item $index");

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return
          WorkoutPlanCard(time: '1 hr 15 min'.tr, isComplete: true);
        // );
      },
    );
  }
}



class ExerciseCard extends StatefulWidget {
  final String day;
  final String exerciseName;
  final String duration;
  final String imageUrl;
  final VoidCallback onExercisePressed;
  final VoidCallback onDeletePressed;

  const ExerciseCard({
    required this.day,
    required this.exerciseName,
    required this.duration,
    required this.imageUrl,
    required this.onExercisePressed,
    required this.onDeletePressed,
  });

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  bool showDelete = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDelete = !showDelete;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.day,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.exerciseName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 16,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.duration,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: widget.onExercisePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Exercise'),
                  ),
                ],
              ),
            ),
            if (showDelete)
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: widget.onDeletePressed,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise Cards'),
        ),
        body: ListView(
          children: [
            ExerciseCard(
              day: 'Wed - Leg Day',
              exerciseName: '1 hr 15 min',
              duration: '1 hr 15 min',
              imageUrl: 'https://via.placeholder.com/80',
              onExercisePressed: () {
                print('Exercise button pressed');
              },
              onDeletePressed: () {
                print('Delete button pressed');
              },
            ),
            ExerciseCard(
              day: 'Friday - Back Day',
              exerciseName: '1 hr 10 min',
              duration: '1 hr 10 min',
              imageUrl: 'https://via.placeholder.com/80',
              onExercisePressed: () {
                print('Exercise button pressed');
              },
              onDeletePressed: () {
                print('Delete button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}




class ExerciseCards extends StatelessWidget {
  final String day;
  final String exerciseName;
  final String duration;
  final String imageUrl;
  final VoidCallback onExercisePressed;
  final VoidCallback onDeletePressed;

  const ExerciseCards({
    required this.day,
    required this.exerciseName,
    required this.duration,
    required this.imageUrl,
    required this.onExercisePressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: onDeletePressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  exerciseName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 16,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onExercisePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Exercise'),
          ),
        ],
      ),
    );
  }
}
