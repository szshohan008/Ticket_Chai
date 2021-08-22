// To parse this JSON data, do
//
//     final ticketPurchaseModel = ticketPurchaseModelFromJson(jsonString);

import 'dart:convert';

TicketPurchaseModel ticketPurchaseModelFromJson(String str) => TicketPurchaseModel.fromJson(json.decode(str));

String ticketPurchaseModelToJson(TicketPurchaseModel data) => json.encode(data.toJson());

class TicketPurchaseModel {
  TicketPurchaseModel({
    this.address,
    this.boardingPoint,
    this.droppingPoint,
    this.name,
    this.phoneNo,
    this.totalSeat,
    this.tripId,
  });

  String address;
  String boardingPoint;
  String droppingPoint;
  String name;
  String phoneNo;
  int totalSeat;
  String tripId;

  factory TicketPurchaseModel.fromJson(Map<String, dynamic> json) => TicketPurchaseModel(
    address: json["address"],
    boardingPoint: json["boardingPoint"],
    droppingPoint: json["droppingPoint"],
    name: json["name"],
    phoneNo: json["phoneNo"],
    totalSeat: json["totalSeat"],
    tripId: json["tripId"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "boardingPoint": boardingPoint,
    "droppingPoint": droppingPoint,
    "name": name,
    "phoneNo": phoneNo,
    "totalSeat": totalSeat,
    "tripId": tripId,
  };
}
