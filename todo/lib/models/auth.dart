import 'package:flutter/foundation.dart';

class UserEmailModel {
  final String email;

  UserEmailModel({required this.email});

  Map<String, dynamic> toJson() => {'email': email};

  factory UserEmailModel.fromJson(Map<String, dynamic> json) {
    return UserEmailModel(
      email: json['email'] as String,
    );
  }
}
