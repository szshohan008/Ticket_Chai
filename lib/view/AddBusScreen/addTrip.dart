//import 'package:ticket_chai/view/AddFlightScreen/utils/flight_pageview.dart';
//import 'package:ticket_chai/view/AddFlightScreen/utils/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Model/display/select_bar.dart';
import 'package:ticket_chai/Model/display/title.dart';
import 'package:ticket_chai/model/TicketPurchaseModel.dart';
import 'package:ticket_chai/networking/BusNetwork.dart';
import 'package:ticket_chai/view/AddBusScreen/utils/Route_page.dart';
import 'package:ticket_chai/view/AddBusScreen/utils/checkout_page.dart';
import 'package:ticket_chai/view/AddBusScreen/utils/flight_pageview.dart';

import 'Checkout/checkoutForm.dart';

// import 'package:emirates_app/display/select_bar.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class AddFlightScreen extends StatefulWidget {
  static const String id = 'add_flight_screen';

  @override
  _AddFlightScreenState createState() => _AddFlightScreenState();
}

class _AddFlightScreenState extends State<AddFlightScreen> {
  PageController _pageController;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentIndex = 0;

  bool show = true;

  onChangeFunction(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 1) {
      show = false;
      return;
    } else {
      show = true;
    }
  }

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController totalSeatController = TextEditingController();
  TextEditingController tripIdSeatController = TextEditingController();

  nextFunction({String tripId, String boardingPoint, String endingPoint})  {
    print(currentIndex);
    if (currentIndex == 0) {
    } else if (currentIndex == 1) {
    } else if (currentIndex == 2) {
      print(nameController.text);
      print(tripId);
      TicketPurchaseModel ticketPurchaseModel = TicketPurchaseModel(
        address: "", boardingPoint: "", droppingPoint: "", name: nameController.text,
          phoneNo: phoneNoController.text, totalSeat: int.parse(totalSeatController.text), tripId: tripIdSeatController.text
      );

       buyTicket(ticketPurchaseModel: ticketPurchaseModel);
    }
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kSemiColor,
      //Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // BuildHead(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Align(alignment: Alignment(-0.9, 0), child: HeadTitle(title: 'Ticket Chai')),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Expanded(
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    //width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                        Tabs(currentIndex: currentIndex),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: onChangeFunction,
                            children: [
                              RoutePage(fromController, toController, dateController),
                              FlightPageView(fromController, toController, dateController, tripIdSeatController, nextFunction),
                              // SeatPage(),
                              CheckoutFrom(nameController, phoneNoController, totalSeatController),
                              Payment(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: true
          ? Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 5.0),
              child: FloatingActionButton(
                child: Icon(
                  Icons.chevron_right_outlined,
                  size: 35.0,
                  color: kMainColor,
                ),
                onPressed: () => nextFunction(),
                tooltip: 'Add new tasks',
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                backgroundColor: kFloatingButton,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

class BuildHead extends StatelessWidget {
  const BuildHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
            color: kMainColor,
            iconSize: 30.0,
          ),
          Spacer(),
          Card(
            //color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(13.0),
                bottomRight: Radius.circular(12.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/profile.png',
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.14,
                fit: BoxFit.cover,
                //color: Color(0xFF0C382E),
                filterQuality: FilterQuality.medium,
                colorBlendMode: BlendMode.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
