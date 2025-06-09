class DataModel {
  final String id;
  final String email;
  final String userName;
  final String? token;

  DataModel({
    required this.id,
    required this.email,
    required this.userName,
    this.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    return DataModel(
      id: user['id'] ?? '',
      email: user['email'] ?? '',
      userName: user['userName'] ?? '',
      token: json['token'], 
    );
  }
   @override
  String toString() {
    return 'DataModel(id: $id, email: $email, userName: $userName, token: $token)';
  }
}
