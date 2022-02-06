class UserNotFoundException implements Exception {
  final int? code;
  final String? message;
  UserNotFoundException(
    this.message, {
    this.code,
  });
}
