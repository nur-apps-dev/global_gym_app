
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';

import '../views/screens/screens.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [

    GetPage(name: RouteNames.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteNames.onboardingScreen, page: () =>const OnboardingScreen()),
    GetPage(name: RouteNames.signInScreen, page: () =>const SignInScreen()),
    GetPage(name: RouteNames.singUpScreen, page: () =>const SignUpScreen()),
    GetPage(name: RouteNames.informationOfClient, page: () =>const InformationOfClient()),
    GetPage(name: RouteNames.forgetPassScreen, page: () =>const ForgetPassScreen()),
    GetPage(name: RouteNames.otpVerificationScreen, page: () =>const OtpVerificationScreen()),
    GetPage(name: RouteNames.resetPassScreen, page: () =>const ResetPassScreen()),
    GetPage(name: RouteNames.subscriptionScreen, page: () =>const SubscriptionScreen()),
     GetPage(name: RouteNames.customNavBar, page: () =>const CustomNavbar()),


    GetPage(name: RouteNames.workOutScreen, page: () =>const WorkoutScreen()),
    GetPage(name: RouteNames.workoutRoutineScreen, page: () => WorkoutRoutineScreen()),
    GetPage(name: RouteNames.exerciseScreen, page: () =>const ExerciseScreen()),
    GetPage(name: RouteNames.swapScreen, page: () =>const SwapScreen()),



    GetPage(name: RouteNames.homeScreen, page: () =>const HomeScreen()),
    GetPage(name: RouteNames.cartScreen, page: () =>const CartScreen()),
    GetPage(name: RouteNames.profileScreen, page: () =>const ProfileScreen()),
    GetPage(name: RouteNames.profileInformation, page: () =>const ProfileInformation()),
    GetPage(name: RouteNames.settingScreen, page: () =>const SettingScreen()),
    GetPage(name: RouteNames.notificationScreen, page: () =>const NotificationScreen()),


    GetPage(name: RouteNames.changePassScreen, page: () =>const ChangePassScreen()),
    GetPage(name: RouteNames.languageSelectionScreen, page: () =>const LanguageSelectionScreen()),
    GetPage(name: RouteNames.privacyPolicyScreen, page: () =>const PrivacyPolicyScreen()),
    GetPage(name: RouteNames.termsScreen, page: () =>const TermsScreen()),
    GetPage(name: RouteNames.aboutScreen, page: () =>const AboutScreen()),


    GetPage(name: RouteNames.mySubscriptionAfterBuy, page: () =>const MySubscriptionAfterBuy()),
    GetPage(name: RouteNames.packageScreen, page: () =>const PackageScreen()),
    GetPage(name: RouteNames.couponScreen, page: () =>const CouponScreen()),
    GetPage(name: RouteNames.bodyFatScreen, page: () => BodyFatProgressScreen()),
    GetPage(name: RouteNames.bodyFatScreen2, page: () => BodyFatProgressScreen2()),
    GetPage(name: RouteNames.routineGenerate1, page: () => RoutineGenerateScreen()),
    GetPage(name: RouteNames.generateRoutine, page: () => GeneraleRoutineScreen1()),
    GetPage(name: RouteNames.addExercise, page: () => AddExercise()),
    GetPage(name: RouteNames.mealPlanScreen, page: () => MealPlanScreen()),
    GetPage(name: RouteNames.mealGenerateScreen, page: () => MealGenerateScreen()),
    GetPage(name: RouteNames.mealInfo, page: () => MealInfo()),
    GetPage(name: RouteNames.foodAddScreen, page: () => FoodAddScreen()),
    GetPage(name: RouteNames.chatScorpionDes, page: () => ChatScorpionDes()),


  ];
}