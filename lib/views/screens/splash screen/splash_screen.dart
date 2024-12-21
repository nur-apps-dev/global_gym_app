import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/global%20widget/custom_button.dart';
import 'package:gimnasio_escorpion/routes/routes_name.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player with your asset video or network video URL
    _controller = VideoPlayerController.asset('assets/video/intro1.mp4') // Replace with a network URL if needed
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // Auto-play video
        });
      });

    // Listen for video completion and navigate to the next screen
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // When the video reaches the end, navigate to the home screen
        Get.offAllNamed(RouteNames.onboardingScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen dimensions
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: FittedBox(
              fit: BoxFit.cover, // Ensures the video covers the full screen
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : const Center(
            child: CircularProgressIndicator(), // Show loader while video initializes
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomTextButton(text: "skipNow".tr, onTap: (){
                  Get.offAllNamed(RouteNames.onboardingScreen);

                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
