import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/user/user_repository.dart';
import 'package:quicks_cart/features/personalization/controller/user/user_controller.dart';
import 'package:quicks_cart/features/personalization/screens/profile/profile_screen.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/helpers/network_manager.dart';
import 'package:quicks_cart/utils/popups/full_screen_loader.dart';
import 'package:quicks_cart/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user Record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      QCFullScreenLoader.openLoadingDialog(
        'We are Updating you Information...',
        QCImages.decorAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        QCFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        QCFullScreenLoader.stopLoading();
        return;
      }
      // update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      userRepository.updateSingleField(name);
      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      // stop loading
      QCFullScreenLoader.stopLoading();
      // Show success message
      QCLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Name has been updated successfully',
      );
      // Move to previous screen
      Get.off(() => ProfileScreen());
    } catch (e) {
      QCFullScreenLoader.stopLoading();
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
