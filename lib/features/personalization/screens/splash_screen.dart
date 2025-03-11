import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/on_boarding_screen.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = QCHelperFunctions.screenHeight();
    var width = QCHelperFunctions.screenWidth();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Get.off(() => const OnBoardingScreen());
      });
    });
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(
          QCHelperFunctions.isDarkMode(context)
              ? QCImages.darkAppLogo
              : QCImages.lightAppLogo,
          height: height * 0.45,
          width: width * 0.5,
        ),
      ),
    );
  }
}
