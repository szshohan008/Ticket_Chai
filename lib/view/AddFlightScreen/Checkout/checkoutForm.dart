import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_chai/view/widgets/custom_input.dart';

class CheckoutFrom extends StatelessWidget {
  CheckoutFrom();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 80.0,
            // color: kMainColor,
            child: Text(
              "Book Ticket",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomInput(labelName: "Name", labelIcon: Icons.add, keyboardType: TextInputType.name, obscure: true),
                    CustomInput(labelName: "Phone No", labelIcon: Icons.add, keyboardType: TextInputType.number, obscure: true),
                    CustomInput(labelName: "Total Seat", labelIcon: Icons.add, keyboardType: TextInputType.number, obscure: true),
                    CustomInput(labelName: "Address", labelIcon: Icons.add, keyboardType: TextInputType.text, obscure: true)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
