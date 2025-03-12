import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../model/user/user_model.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../authentication/screens/login/login_screen.dart';
import '../../screens/re_auth_login_form/re_auth_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // first update Rx user and then check if user data is already stored .If not then store new data
      await fetchUserRecord();
      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // convert Name to first and last name
          final nameParts = UserModel.namePart(
            userCredential.user!.displayName ?? '',
          );
          final userName = UserModel.generateUserName(
            userCredential.user!.displayName ?? '',
          );
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // save user data
          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      QCLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }

  /// Delete Account warning Popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(QCSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QCSizes.md),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      QCFullScreenLoader.openLoadingDialog(
        'Processing',
        QCImages.decorAnimation,
      );
      // First reAuthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          auth.signInWithGoogle();
          auth.deleteAccount();
          QCFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          QCFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      QCFullScreenLoader.stopLoading();
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-Authenticate User before deleting
  void reAuthenticateEmailAndPasswordUser() async {
    try {
      // start loading
      QCFullScreenLoader.openLoadingDialog(
        'Processing...',
        QCImages.decorAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        QCFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        QCFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();
      // stop loading
      QCFullScreenLoader.stopLoading();
      Get.to(() => LoginScreen());
    } catch (e) {
      QCFullScreenLoader.stopLoading();
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// update user profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        // upload image

        final imageUrl = await userRepo.uploadImage(
          'Users/Images/Profile/',
          image,
        );
        // update user profile picture
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepo.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        QCLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Profile Picture has been updated.',
        );
      }
    } catch (e) {
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
