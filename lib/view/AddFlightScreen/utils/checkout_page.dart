import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.55, top: MediaQuery.of(context).size.height * 0.02),
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
                child: Container(width: MediaQuery.of(context).size.width * 2.1, height: 0.5, color: kTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPay({String name, bool click}) {
    return TextButton.icon(
      icon: Icon(
        Ionicons.ios_checkmark,
        color: click ? kFloatingButton : Colors.white,
      ),
      label: Text(name, style: click ? kScrollTabClicked : kFlightDateDisplay),
      onPressed: () {},
    );
  }
}
