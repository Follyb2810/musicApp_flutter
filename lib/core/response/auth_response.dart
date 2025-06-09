class AuthResponse {
  final String accessToken;
  final User user;

  AuthResponse({required this.accessToken, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String email;
  final List<String> role;
  final Profile profile;
  final String walletAddress;
  final String id;
  final String username;
  final bool isVerified;
  final String? kycStatus;
  final String? phoneNumber;

  User({
    required this.email,
    required this.role,
    required this.profile,
    required this.walletAddress,
    required this.id,
    required this.username,
    required this.isVerified,
    this.kycStatus,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      role: List<String>.from(json['role']),
      profile: Profile.fromJson(json['profile']),
      walletAddress: json['walletAddress'],
      id: json['_id'],
      username: json['username'],
      isVerified: json['isVerified'],
      kycStatus: json['kycStatus'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

class Profile {
  final String? name;
  final String? bio;
  final String avatar;

  Profile({this.name, this.bio, required this.avatar});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      bio: json['bio'],
      avatar: json['avatar'],
    );
  }
}
