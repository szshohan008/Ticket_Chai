import 'package:flutter/material.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';
import 'package:ticket_chai/Model/display/plane_curve.dart';

class SeatPage extends StatefulWidget {
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: kTextColor.withOpacity(0.2),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                        SizedBox(height: 30.0),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  for (var i = 0; i < 2; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder: kTextColor.withOpacity(0.4),
                                        secColor: Colors.transparent,
                                        secborder: kFloatingButton),
                                  buildNumSeat(
                                      firstcolor: kFloatingButton,
                                      firstborder: kTextColor.withOpacity(0.4),
                                      secColor: Colors.transparent,
                                      secborder: kTextColor.withOpacity(0.4)),
                                  for (var i = 0; i < 6; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder: kTextColor.withOpacity(0.4),
                                        secColor: Colors.transparent,
                                        secborder: kFloatingButton),
                                ],
                              ),
                              Column(
                                children: [
                                  for (var i = 0; i < 9; i++)
                                    buildNumSeat(
                                        firstcolor: Colors.transparent,
                                        firstborder: kFloatingButton,
                                        secColor: Colors.transparent,
                                        secborder: kTextColor.withOpacity(0.4)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text(
                'Dhaka',
                style: kCountryAbText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomPaint(
                painter: PlaneCurved(bodyColor: kFloatingButton, width: 0.2),
                child: Container(
                  //height: 0.0,
                  width: 48.0,
                ),
              ),
              Text(
                '8hr 00m',
                style: kFlightDateDisplay,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Rangpur',
                style: kCountryAbText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Hanif Enterprice',
                style: kFlightDate,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text('C1', style: kCountryAbText),
              Text('Seat', style: kCountryName),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNumSeat({Color firstcolor, Color firstborder, Color secColor, Color secborder}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
          width: 25.0,
          height: 30.0,
          padding: EdgeInsets.symmetric(vertical: 6.5),
          decoration: BoxDecoration(
            color: firstcolor,
            border: Border.all(
              width: 1,
              color: firstborder,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7),
              bottom: Radius.circular(6),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
          // height: 20.0,
          width: 25.0,
          height: 30.0,
          padding: EdgeInsets.symmetric(vertical: 6.5),
          decoration: BoxDecoration(
            color: secColor,
            border: Border.all(
              width: 1,
              color: secborder,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7),
              bottom: Radius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
