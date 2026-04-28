class AuthResponse {
  final String token;
  final int id;
  final String username;
  final String email;
  final List<String> roles;

  AuthResponse({
    required this.token,
    required this.id,
    required this.username,
    required this.email,
    required this.roles,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['accessToken'] ?? '',
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
    );
  }
}