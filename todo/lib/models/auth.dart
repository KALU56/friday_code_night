class UserEmailModel {
  final String? id;
  final String email;
  final String userName;
  final String phone;


  UserEmailModel({this.id, required this.email,
    this.userName = '',
    this.phone = '',
  });

  Map<String, dynamic> toJson() {
    return {'email': email,
            'userName': userName,
            'phone': phone,
           };
  }

factory UserEmailModel.fromJson(
  Map<String, dynamic> json,
  String documentId,
) {
  return UserEmailModel(
    id: documentId,
    email: json['email'] as String,
    userName: json['userName'] ?? '',
    phone: json['phone'] ?? '',
  );
}
}
