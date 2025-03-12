import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/authentication/authentication_repository.dart';
import 'package:quicks_cart/model/user/user_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data from firebase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  /// Function to fetch user details based on User Id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db
              .collection("Users")
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  /// Function to update user Data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  /// Function to update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  /// Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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
