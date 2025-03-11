import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClicked(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index); // Corrected to jumpToPage
  }

  /// update current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      deviceStorage.write('IsFirstTime', false);
      Get.offAll(() => const LoginScreen()); // Navigate to LoginScreen
    } else {
      int nextPage = currentPageIndex.value + 1;
      currentPageIndex.value = nextPage; // Correct observable value
      pageController.jumpToPage(nextPage); // Jump to the next page
    }
  }

  /// update current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2); // Jump to the last page
  }

  /// Dispose of PageController
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
