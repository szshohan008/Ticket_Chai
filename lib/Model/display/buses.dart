import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';
import 'plane_curve.dart';

class Flight extends StatefulWidget {
  @override
  _FlightState createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 40.0),
      child: Column(
        children: [
          for (DisplayBus displayFlight in flights)
            GestureDetector(
              child: fullFlightList(displayFlight),
              onTap: () {
               // Navigator.pushNamed(context, DetailScreen.id);
              },
            ),
        ],
      ),
    );
  }

  // for (DisplayFlight displayFlight in flights)
  //           fullFlightList(displayFlight)

  // Widget _checkLastItem() {
  //   if () {

  //   }
  // }

  Widget fullFlightList(DisplayBus displayFlight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayFlight.startCountryAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayFlight.startCountryName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'DATE',
                    style: kFlightDate,
                  ),
                  Text(
                    displayFlight.flightDate,
                    style: kFlightDateDisplay,
                  ),
                ],
              ),
            ),
            // SizedBox(width: 6.0),
            Column(
              children: [
                CustomPaint(
                  painter: PlaneCurved(bodyColor: kFloatingButton, width: 0.2),
                  child: Container(
                    //height: 0.0,
                    width: 48.0,
                    child: Icon(
                      Entypo.eye_with_line,
                      color: kFloatingButton,
                    ),
                  ),
                ),
                Text(
                  displayFlight.flightTime,
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
                    displayFlight.destinationAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayFlight.destinationName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    '',
                    style: kFlightDate,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      displayFlight.flightNumber,
                      style: kFlightDateDisplay,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Divider(
          color: kFloatingButton,
          thickness: 0.2,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      ],
    );
  }
}

final List<DisplayBus> flights = [
  DisplayBus(
      startCountryAb: 'Dhaka',
      startCountryName: '',
      destinationAb: 'Rangpur',
      destinationName: '',
      flightDate: 'May 19, 8:35 AM',
      flightTime: '8hr 00m',
      flightNumber: 'Hanif'),
  DisplayBus(
      startCountryAb: 'Rangpur',
      startCountryName: '',
      destinationAb: 'Dhaka',
      destinationName: '',
      flightDate: 'May 23, 2:15 PM',
      flightTime: '8hr 00m',
      flightNumber: 'Ena'),
  DisplayBus(
      startCountryAb: 'Dhaka',
      startCountryName: '',
      destinationAb: 'Chottogram',
      destinationName: '',
      flightDate: 'May 29, 13:00 AM',
      flightTime: '6hr 15m',
      flightNumber: 'Ena'),
  DisplayBus(
      startCountryAb: 'Dhaka',
      startCountryName: '',
      destinationAb: 'Bandorban',
      destinationName: '',
      flightDate: 'May 29, 13:00 AM',
      flightTime: '7hr 15m',
      flightNumber: 'Hanif'),
];

class DisplayBus {
  final String startCountryAb;
  final String startCountryName;
  final String destinationAb;
  final String destinationName;
  final String flightDate;
  final String flightNumber;
  final String flightTime;

  DisplayBus(
      {@required this.startCountryAb,
      @required this.startCountryName,
      @required this.destinationAb,
      @required this.destinationName,
      @required this.flightDate,
      @required this.flightTime,
      @required this.flightNumber});
}
