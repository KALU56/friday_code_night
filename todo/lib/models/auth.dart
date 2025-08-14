class UserEmailModel {
  final String? id; 
  final String email;


  UserEmailModel({
    this.id,
    required this.email,

  });

  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
     
    };
  }

  factory UserEmailModel.fromJson(Map<String, dynamic> json, String documentId) {
    return UserEmailModel(
      id: documentId,
      email: json['email'] as String,

    );
  }
}