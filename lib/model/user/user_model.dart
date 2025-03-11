import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quicks_cart/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// constructor for user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// helper function for full name
  String get fullName => '$firstName $lastName';

  /// helper function to format phone number
  String get formattedPhoneNumber => QCFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name
  static List<String> namePart(fullName) => fullName.split(" ");

  /// static function to generate a user name from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  /// static function to create a UserModel from a firebase document snapshot
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  /// Convert model to JSON structure for storing data in firestore
  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'email': email,
    'phoneNumber': phoneNumber,
    'profilePicture': profilePicture,
  };

  /// Factory Method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    }
    return empty();
  }
}
