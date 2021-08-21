import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Model/display/plane_curve.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  // bool pressbutton = false;

  // onButtonClick() {
  //   setState(() {
  //     pressbutton = !pressbutton;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 50.0, right: 50.0, top: 30.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dhaka',
                          style: kCountryAbText,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        Text(
                          'FLIGHT DATE',
                          style: kFlightDate,
                        ),
                        Text(
                          'May 19',
                          style: kFlightDateDisplay,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 6.0),
                  Column(
                    children: [
                      SizedBox(height: 20.0),
                      CustomPaint(
                        painter:
                            PlaneCurved(bodyColor: kFloatingButton, width: 0.2),
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
                          height: MediaQuery.of(context).size.height * 0.07),
                      Text(
                        'Seat No',
                        style: kFlightDate,
                      ),
                      Text(
                        'C1',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                  //Spacer(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rang',
                          style: kCountryAbText,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        Text(
                          'Hanif Enterprice',
                          style: kFlightDate,
                        ),
                        Text(
                          '',
                          style: kFlightDateDisplay,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DATE',
                        style: kFlightDate,
                      ),
                      Text(
                        'May 19',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SEAT',
                        style: kFlightDate,
                      ),
                      Text(
                        '1',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CLASS',
                        style: kFlightDate,
                      ),
                      Text(
                        'Non Ac',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Divider(
                thickness: 0.3,
                color: kTextColor,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.55,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(5, -4),
                          child: Text(
                            '\$',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: kFloatingButton,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\t170.00',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: kFloatingButton,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildPay(name: 'Bkash', click: true),
                  Container(width: 0.5, height: 40.0, color: kTextColor),
                  buildPay(name: 'Nogod', click: false),
                  Container(width: 0.5, height: 40.0, color: kTextColor),
                  buildPay(name: 'Rocket', click: false),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 2.1,
                    height: 0.5,
                    color: kTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPay({String name, bool click}) {
    return FlatButton.icon(
      icon: Icon(
        Ionicons.ios_checkmark,
        color: click ? kFloatingButton : Colors.white,
      ),
      label: Text(name, style: click ? kScrollTabClicked : kFlightDateDisplay),
      onPressed: () {},
    );
  }
}
