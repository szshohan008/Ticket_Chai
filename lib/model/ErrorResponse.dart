// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  DateTime timestamp;
  int status;
  String error;
  String message;
  String path;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
    error: json["error"],
    message: json["message"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "error": error,
    "message": message,
    "path": path,
  };
}
