import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_chai/view/AddFlightScreen/Checkout/utils/textInfo.dart';

class checkoutPage extends StatefulWidget {
  checkoutPage({Key key}) : super(key: key);

  @override
  _checkoutPageState createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child:
                profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 80.0,
          color: Colors.white,
        ),

        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
          child: Card(
            child: Container(
                padding: EdgeInsets.only(
                    top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infotext('Name', 'Address', 'Phone Number',
                        'Bording Point', 'Dropping Point', 'Total Seat'),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
