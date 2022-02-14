// ignore_for_file: overridden_fields

import 'failure.dart';

class HttpServiceException extends Failure {
  HttpServiceException({required this.success, required this.message})
      : super(message, success: success);

  @override
  final bool success;
  @override
  final String message;

  factory HttpServiceException.fromJson(Map<String, dynamic> json) =>
      HttpServiceException(
        success: json["success"],
        message: json["message"],
      );
}
