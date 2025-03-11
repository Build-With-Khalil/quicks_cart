import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/user/user_repository.dart';
import 'package:quicks_cart/utils/popups/loaders.dart';

import '../../../../model/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
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
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // save user data
        await userRepo.saveUserRecord(user);
      }
    } catch (e) {
      QCLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }
}
