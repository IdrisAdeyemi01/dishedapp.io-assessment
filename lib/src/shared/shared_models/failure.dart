class Failure {
  Failure(
    this.message, {
    this.success,
  });

  final String message;
  final bool? success;
}
