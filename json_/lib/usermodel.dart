class User {
  final String name;
  final String username;
  final String email;
  final String phone;
  

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,

  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "phone": phone,
      
    };
  }

  static fromJson(e) {}
}
