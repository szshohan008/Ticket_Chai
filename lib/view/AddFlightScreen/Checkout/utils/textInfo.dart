import 'package:flutter/material.dart';

infotext(String Name, String Address, String Phone_Number, String Bording_Point,
    String Dropping_Point, String seat) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _buildText(Name),
      _buildText(Address),
      _buildText(Phone_Number),
      _buildText(Bording_Point),
      _buildText(Dropping_Point),
      _buildText(seat),
    ],
  );
}

_buildText(String labelText) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(bottom: 20.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: .6,
        ),
      ),
    ),
    child: Text(
      labelText,
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
    ),
  );
}
