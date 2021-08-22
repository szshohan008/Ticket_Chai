import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ticket_chai/model/ErrorResponse.dart';
import 'package:ticket_chai/model/SearchBusModel.dart';
import 'package:ticket_chai/model/TicketPurchaseModel.dart';

const SERVER_IP = 'https://ticket-chai-backend.herokuapp.com';

Future<SearchBusModel> getBusList({String from, String to, String date}) async {
  print('Entering GetBusList');

  Map<String, String> headers = {'Content-Type': 'application/json'};

  String requestLink = "$SERVER_IP/api/user/tickets/search?date=$date&from=$from&to=$to";

  print(requestLink);

  var res = await http.get(requestLink, headers: headers);

  print(res.statusCode);

  if (res.statusCode == 200) {
    SearchBusModel searchBusModel = SearchBusModel.fromJson(json.decode(res.body));

    print(searchBusModel.message);

    return searchBusModel;
  } else {
    ErrorResponse errorResponse = errorResponseFromJson(res.body);

    print(errorResponse.message);
    return null;
  }
}

Future<void> buyTicket({TicketPurchaseModel ticketPurchaseModel}) async {
  print('Entering buy Ticket');

  Map<String, String> headers = {'Content-Type': 'application/json'};

  String requestLink = "$SERVER_IP/api/user/tickets/purchase";

  print(requestLink);
  print(json.encode(ticketPurchaseModel.toJson()));

  var res = await http.post(requestLink, headers: headers, body: json.encode(ticketPurchaseModel.toJson()));

  print(res.statusCode);

  if (res.statusCode == 200) {
    print(res.body);

    return null;
  } else {
    ErrorResponse errorResponse = errorResponseFromJson(res.body);

    print(errorResponse.message);
    return null;
  }
}
