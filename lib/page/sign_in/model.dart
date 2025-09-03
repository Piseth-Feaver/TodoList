class SingRequest{
  final String username;
  final String password;
  SingRequest({
    required this.username,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
class SignInResponse {
  final String username;
  final String accessToken;

  const SignInResponse({
    required this.username,
    required this.accessToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      username: json['username'],
      accessToken: json['accessToken'],
    );
  }
}