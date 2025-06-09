import 'package:musicapp/feature/auth/model/data_model.dart';

class UserModel {
  final DataModel user;
  final int statusCode;
  final String? message;

  UserModel({
    required this.user,
    required this.statusCode,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, int statusCode) {
    return UserModel(
      user: DataModel.fromJson({
        ...json['user'],
        'token': json['token'] ?? '',
      }),
      statusCode: statusCode,
      message: json['message'],
    );
  }

 @override
  String toString() {
    return 'UserModel(user: $user, statusCode: $statusCode, message: $message)';
  }
}

