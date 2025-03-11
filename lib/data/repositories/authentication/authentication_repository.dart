import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quicks_cart/navigation_menu.dart';

import '../../../features/authentication/screens/On_Boarding/on_boarding_screen.dart';
import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/sign_up/email/verify_email_screen.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

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
    final user = _auth.currentUser;

    /// Check if user is logged in
    if (user != null) {
      /// Check if the user is logged In
      if (user.emailVerified) {
        /// Check if email is verified and redirect to navigation menu
        Get.offAll(() => NavigationMenu());
      } else {
        /// Check if email is not verified and redirect to verify email screen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// Check if user is not logged in and redirect to login screen
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  /*---------------------Email & Password sign-in logic---------------------*/

  ///[Email Authentication] - Sign In Logic
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  ///[Email Authentication] Mail Verification Logic
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
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

  ///[Email Authentication] UPDATE PASSWORD Logic
  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // trigger the authentication Flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw QCFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw QCFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const QCFormatException();
    } on PlatformException catch (e) {
      throw QCPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went Wrong: $e');
      return null;
    }
  }

  ///[LogoutUser] Valid for any authentication
  Future<void> logout() async {
    try {
      GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
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
}
