import 'package:flutter/material.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';

class HeadTitle extends StatelessWidget {
  final String title;
  HeadTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.white//kMainColor,
        ),
      ),
    );
  }
}
