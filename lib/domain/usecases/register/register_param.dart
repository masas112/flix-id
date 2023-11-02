class RegisterParams {
  final String email;
  final String password;
  final String name;
  final String? photoUrl;

  RegisterParams(
      {required this.email,
      required this.password,
      required this.name,
      this.photoUrl});
}
