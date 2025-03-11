import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/components/on_boarding_dot_navigation.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/components/on_boarding_next_button.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/components/on_boarding_page.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/components/on_boarding_skip.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../controllers/On_Boarding/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /// Horizontal Scrollable Pages
            PageView(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.updatePageIndicator,
              children: [
                OnBoardingPage(
                  image: QCImages.onBoardingImage1,
                  title: QCTexts.onBoardingTitle1,
                  subTitle: QCTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: QCImages.onBoardingImage2,
                  title: QCTexts.onBoardingTitle2,
                  subTitle: QCTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: QCImages.onBoardingImage3,
                  title: QCTexts.onBoardingTitle3,
                  subTitle: QCTexts.onBoardingSubTitle3,
                ),
              ],
            ),

            /// Skip Button
            OnBoardingSkip(),

            /// Dot Navigation SmoothPageIndicator
            OnBoardingDotNavigation(),

            /// Circular Button
            OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
