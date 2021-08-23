import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/model/SearchBusModel.dart';
import 'package:ticket_chai/networking/BusNetwork.dart';

import '../../../Constants/TextConstants.dart';

class FlightPageView extends StatefulWidget {
  FlightPageView(TextEditingController fromController, TextEditingController toController, TextEditingController dateController,
      TextEditingController tripId, Function({String boardingPoint, String endingPoint, String tripId}) nextFunction) {
    this.fromController = fromController;
    this.toController = toController;
    this.dateController = dateController;
    this.tripId = tripId;
    this.nextFunction = nextFunction;
  }

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController tripId = TextEditingController();
  Function({String boardingPoint, String endingPoint, String tripId}) nextFunction;

  @override
  _FlightPageViewState createState() => _FlightPageViewState(fromController, toController, dateController, tripId);
}

class _FlightPageViewState extends State<FlightPageView> {
  _FlightPageViewState(TextEditingController fromController, TextEditingController toController,
      TextEditingController dateController, TextEditingController tripId) {
    this.fromController = fromController;
    this.toController = toController;
    this.dateController = dateController;
    this.tripId = tripId;
  }

  TextEditingController tripId = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final Widget svgEmiratesImage = SvgPicture.asset(
    '',
    color: kFloatingButton,
    height: 60.0,
  );

  SearchBusModel buses = SearchBusModel();

  @override
  Widget build(BuildContext context) {
    bool changeCardColor = false;
    return FutureBuilder(
      future: getBusList(from: fromController.text, to: toController.text, date: dateController.text),
      builder: (BuildContext context, AsyncSnapshot<SearchBusModel> snapshot) {
        if (snapshot.hasData) {
          buses = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 10.0),
                child: Text(
                  buses.data.length.toString() + ' Buses available',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: buses.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        // onTap: () {
                        //   tripId = buses.data[index].id;
                        //   print(tripId);
                        // },
                        onTap: () {
                          print(buses.data[index].id);
                          print(0);
                          tripId.text = buses.data[index].id;
                          widget.nextFunction();
                        },
                        child: card(svgEmiratesImage, changeCardColor, buses.data[index]));
                  },
                  // children: [
                  //   GestureDetector(onTap: () => changeCardColor = !changeCardColor, child: card(svgEmiratesImage, changeCardColor)),
                  //   GestureDetector(onTap: () => changeCardColor = !changeCardColor, child: card(svgEmiratesImage, changeCardColor)),
                  // ],
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
      },
    );
  }

  // bool changeCardColor = false;

  Card card(Widget svgEmiratesImage, bool changeCardColor, Datum data) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      color: changeCardColor == true ? kTextColor : kMainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.white, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                        data.operatorName,
                        // style: changeCardColor == true ? kCardMainText : kCardMainText2,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 28.0),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'DATE',
                                style: kCardSub2,
                              ),
                              Text(
                                data.tripDate,
                                style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Bus Type',
                                style: kCardSub2,
                              ),
                              Text(
                                data.busType,
                                style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Seat Type',
                                style: kCardSub2,
                              ),
                              Text(
                                data.seatType,
                                style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Seat Available',
                                style: kCardSub2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    (data.seatAvailable == null) ? data.totalSeat.toString() : data.seatAvailable.toString(),
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "of",
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    data.totalSeat.toString(),
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Boarding',
                                style: kCardSub2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    data.tripStartingPoint,
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    data.tripStartTime,
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Bus Type',
                                style: kCardSub2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    data.tripEndingPoint,
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    data.tripEndTime,
                                    style: changeCardColor == true ? kCardSubText : kCardSubTextWhite,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    svgEmiratesImage,
                    SizedBox(height: 20.0),
                  ],
                ),
                //Spacer(),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Divider(
              color: kTextColor,
              thickness: 0.4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => CheckoutFrom()),
                        // );
                      },
                      child: Text(
                        'Book Ticket',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text('Ticket Price', style: kTextStyle),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 3.0),
                  child: Text('\৳', style: changeCardColor == true ? kCardMainText : kCardMainText2),
                ),
                Text(data.ticketFare.toString(), style: changeCardColor == true ? kCardMainText : kCardMainText2),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding cardPadding({double left, Color color, IconData icon, Color iconColor}) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.circular(20),
          ),
        ),
        child: Icon(icon, size: 17.0, color: iconColor),
      ),
    );
  }

  Widget flightDays({@required String day, @required String dayNum, bool isclick}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      // height: 20.0,
      width: 50.0,
      padding: EdgeInsets.symmetric(vertical: 6.5),
      decoration: BoxDecoration(
        color: kMainColor,
        border: Border.all(
          width: isclick ? 0 : 1,
          color: kTextColor.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
          bottom: Radius.circular(10),
        ),
        boxShadow: isclick
            ? [
                BoxShadow(
                  color: kMainColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(day, style: isclick ? kScrollTabClicked : kScrollTabText),
          Text(
            dayNum,
            style: isclick ? kScrollTabClicked : kScrollTabText2,
            textScaleFactor: 1.8,
          ),
        ],
      ),
    );
  }
}
