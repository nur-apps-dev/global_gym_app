// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/controller/localization_controller.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:gimnasio_escorpion/routes/routes_page.dart';
import 'package:gimnasio_escorpion/themes/light_theme.dart';
import 'package:gimnasio_escorpion/utlis/app_constant.dart';
import 'package:gimnasio_escorpion/utlis/message.dart';
import 'helpers/di.dart' as di;

import 'controller/controller_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await di.init();


  runApp(MyApp(
    languages: _languages,
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(360, 690),
//       // minTextAdapt: true,
//       // splitScreenMode: true,
//       builder: (_, child) {
//         return GetMaterialApp(
//           translations: Languages(), // Use your Languages class here
//           locale: Locale('en', 'US'), // Default locale
//           fallbackLocale: Locale('en', 'US'), // Fallback if locale not found
//           theme: light(),
//           debugShowCheckedModeBanner: false,
//           getPages: RoutePages.routes,
//           initialRoute: RouteNames.splashScreen,
//           initialBinding: ControllerBindings(),
//         );
//       },
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return GetMaterialApp(
              title: "App Name",
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.key,
              theme: light(),
              getPages: RoutePages.routes,
              initialRoute: RouteNames.splashScreen,
              initialBinding: ControllerBindings(),
              // theme: themeController.darkTheme ? dark(): light(),

              defaultTransition: Transition.topLevel,
              locale: localizeController.locale,
              translations: Messages(languages: languages),
              fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                  AppConstants.languages[0].countryCode),
              transitionDuration: const Duration(milliseconds: 500),
            );
          });
    });
  }
}
