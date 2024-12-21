import 'package:get/get.dart';

class WorkoutRoutineController extends GetxController {
  RxString selectedFitness = ''.obs;
  RxString selectedLocation = ''.obs;
  RxString selectedDuration = ''.obs;
  RxString selectedFrequency = ''.obs;
  RxString selectedLevel = ''.obs;
  RxString selectedMuscle = ''.obs;
  RxString selectedInjury = ''.obs;

  final List<String> fitnessLevel = ['activity_basic'.tr, 'activity_intermediate'.tr, 'activity_advanced'.tr];
  final List<String> trainingLocations = ["at_home".tr, "at_gym".tr];
  final List<String> trainingDurations = ["20_minutes".tr, "45_minutes".tr, "60_minutes".tr];
  final List<String> weeklyFrequencies = ["2", "3", "4", "5"];
  final List<String> trainingLevels = ["basic".tr, "intermediate".tr, "advanced".tr];
  final List<String> musclesOfInterest = [
    "general_growth".tr,
    "legs_glutes".tr,
    "back".tr,
    "chest".tr,
    "shoulders_arms".tr,
    "core".tr
  ];
  final List<String> injuries = ["lower_back".tr, "knees".tr, "shoulder_rotator_cuff".tr, "none".tr];
  final List<String> days = ['Mon'.tr, 'Tue'.tr, 'Wed'.tr, 'Thu'.tr, 'Fri'.tr, 'Sat'.tr, 'Sun'.tr];
  final Set<int> selectedDays = {6};
}
