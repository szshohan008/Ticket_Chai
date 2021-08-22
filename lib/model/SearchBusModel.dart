// To parse this JSON data, do
//
//     final searchBusModel = searchBusModelFromJson(jsonString);

import 'dart:convert';

SearchBusModel searchBusModelFromJson(String str) => SearchBusModel.fromJson(json.decode(str));

String searchBusModelToJson(SearchBusModel data) => json.encode(data.toJson());

class SearchBusModel {
  SearchBusModel({
    this.data,
    this.message,
    this.statusCode,
  });

  List<Datum> data;
  String message;
  int statusCode;

  factory SearchBusModel.fromJson(Map<String, dynamic> json) => SearchBusModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "statusCode": statusCode,
  };
}

class Datum {
  Datum({
    this.boardingPoints,
    this.busType,
    this.createdAt,
    this.createdBy,
    this.endingPoints,
    this.id,
    this.operatorName,
    this.seatAvailable,
    this.seatType,
    this.ticketFare,
    this.totalSeat,
    this.tripCode,
    this.tripDate,
    this.tripEndTime,
    this.tripEndingPoint,
    this.tripStartTime,
    this.tripStartingPoint,
    this.updatedAt,
    this.updatedBy,
  });

  List<String> boardingPoints;
  String busType;
  int createdAt;
  String createdBy;
  List<String> endingPoints;
  String id;
  String operatorName;
  int seatAvailable;
  String seatType;
  int ticketFare;
  int totalSeat;
  String tripCode;
  String tripDate;
  String tripEndTime;
  String tripEndingPoint;
  String tripStartTime;
  String tripStartingPoint;
  int updatedAt;
  String updatedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    boardingPoints: List<String>.from(json["boardingPoints"].map((x) => x)),
    busType: json["busType"],
    createdAt: json["createdAt"],
    createdBy: json["createdBy"],
    endingPoints: List<String>.from(json["endingPoints"].map((x) => x)),
    id: json["id"],
    operatorName: json["operatorName"],
    seatAvailable: json["seatAvailable"],
    seatType: json["seatType"],
    ticketFare: json["ticketFare"],
    totalSeat: json["totalSeat"],
    tripCode: json["tripCode"],
    tripDate: json["tripDate"],
    tripEndTime: json["tripEndTime"],
    tripEndingPoint: json["tripEndingPoint"],
    tripStartTime: json["tripStartTime"],
    tripStartingPoint: json["tripStartingPoint"],
    updatedAt: json["updatedAt"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "boardingPoints": List<dynamic>.from(boardingPoints.map((x) => x)),
    "busType": busType,
    "createdAt": createdAt,
    "createdBy": createdBy,
    "endingPoints": List<dynamic>.from(endingPoints.map((x) => x)),
    "id": id,
    "operatorName": operatorName,
    "seatAvailable": seatAvailable,
    "seatType": seatType,
    "ticketFare": ticketFare,
    "totalSeat": totalSeat,
    "tripCode": tripCode,
    "tripDate": tripDate,
    "tripEndTime": tripEndTime,
    "tripEndingPoint": tripEndingPoint,
    "tripStartTime": tripStartTime,
    "tripStartingPoint": tripStartingPoint,
    "updatedAt": updatedAt,
    "updatedBy": updatedBy,
  };
}
