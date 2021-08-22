import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';

class CustomInput extends StatefulWidget {
  CustomInput(
      {@required String labelName,
      @required IconData labelIcon,
      @required TextInputType keyboardType,
      @required bool obscure,
      @required TextEditingController controller}) {
    this.labelName = labelName;
    this.labelIcon = labelIcon;
    this.keyboardType = keyboardType;
    this.obscure = obscure;
    this.controller = controller;
  }

  String labelName;
  IconData labelIcon;
  TextInputType keyboardType;
  bool obscure;
  TextEditingController controller = TextEditingController();

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  get typeIn => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      // height: _inputAnimation.value,
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 7.0, top: 4.0, bottom: 14.0),
                child: Icon(
                  widget.labelIcon,
                  color: kFloatingButton,
                  size: 18.0,
                ),
              ),
              SizedBox(width: 6.0),
              Container(width: 0.5, height: 45.0, color: typeIn == true ? kFloatingButton : kTextColor),
              SizedBox(width: 14.0),
              Expanded(
                child: TextFormField(
                  keyboardType: widget.keyboardType,
                  textCapitalization: TextCapitalization.none,
                  obscureText: widget.obscure,
                  controller: widget.controller,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kFloatingButton,
                  ),
                  onTap: () {},
                  cursorColor: kTextColor,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                    focusColor: kTextColor,
                    labelText: widget.labelName,
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 15.0,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width * 2.1, height: 0.5, color: typeIn == true ? kFloatingButton : kTextColor),
        ],
      ),
    );
  }
}
