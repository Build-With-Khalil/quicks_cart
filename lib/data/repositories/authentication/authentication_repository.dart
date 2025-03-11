import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quicks_cart/features/authentication/screens/On_Boarding/on_boarding_screen.dart';
import 'package:quicks_cart/features/authentication/screens/login/login_screen.dart';
import 'package:quicks_cart/utils/exceptions/firebase_exceptions.dart';
import 'package:quicks_cart/utils/exceptions/format_exceptions.dart';
import 'package:quicks_cart/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
  }

  /*---------------------Email & Password sign-in logic---------------------*/

  ///[Email Authentication] - Sign In Logic
  ///[Email Authentication] REGISTER Logic
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw QCFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw QCFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const QCFormatException();
    } on PlatformException catch (e) {
      throw QCPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///[Email Authentication] RESET PASSWORD Logic
  ///[Email Authentication] UPDATE PASSWORD Logic
}
