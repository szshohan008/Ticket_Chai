import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';

class RoutePage extends StatefulWidget {
  RoutePage(TextEditingController fromController, TextEditingController toController, TextEditingController dateController) {
    this.fromController = fromController;
    this.toController = toController;
    this.dateController = dateController;
  }

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  _RoutePageState createState() => _RoutePageState(fromController, toController, dateController);
}

class _RoutePageState extends State<RoutePage> {
  List data;

  _RoutePageState(
      TextEditingController fromController, TextEditingController toController, TextEditingController dateController) {
    this.fromController = fromController;
    this.toController = toController;
    this.dateController = dateController;
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 10.0),
            child: _buildTrip(),
          ),
          SizedBox(height: 10.0),
          _buildDetails(labelName: 'FROM', labelIcon: Entypo.location_pin, context: context, controller: fromController),
          _buildDetails(labelName: 'TO', labelIcon: Entypo.location, context: context, controller: toController),
          _buildDetails(
              labelName: 'DATE OF Journey', labelIcon: SimpleLineIcons.calendar, context: context, controller: dateController),
          // _buildDetails(labelName: 'DATE OF Return', labelIcon: SimpleLineIcons.calendar, context: context),
        ],
      ),
    );
  }

  Widget _buildDetails(
      {@required String labelName, @required IconData labelIcon, BuildContext context, TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 7.0, top: 4.0, bottom: 14.0),
                  child: Icon(
                    labelIcon,
                    color: kFloatingButton,
                    size: 23.0,
                  ),
                ),
                SizedBox(width: 6.0),
                Container(width: 0.5, height: 39.0, color: kTextColor),
                SizedBox(width: 14.0),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    cursorColor: kTextColor,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusColor: kTextColor,
                      labelText: labelName,
                      labelStyle: TextStyle(
                        color: kTextColor,
                        fontFamily: 'Gilroy',
                        fontSize: 12.0,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
            Container(width: MediaQuery.of(context).size.width * 2.1, height: 0.5, color: kTextColor),
          ],
        ),
      ),
    );
  }

  bool isClicked = true;

  Widget _buildTrip() {
    return Container(
      // padding: EdgeInsets.only(bottom: 0.3),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 15.0, top: 4.0, bottom: 14.0),
                child: Text(
                  'Search and Buy Bus Tickets',
                  style: isClicked ? kTripTextSelected : kTripText,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(width: MediaQuery.of(context).size.width * 2.1, height: 0.5, color: kTextColor),
          ),
        ],
      ),
    );
  }
}
