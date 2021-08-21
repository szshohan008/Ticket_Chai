import 'package:flutter/material.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/Constants/TextConstants.dart';
import 'package:ticket_chai/view/Home/homePage.dart';

class AccessOption extends StatefulWidget {
  @override
  _AccessOptionState createState() => _AccessOptionState();
}

class _AccessOptionState extends State<AccessOption> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  Animation _accesAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));


    _accesAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.60, 1.0, curve: Curves.easeOut)));

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _accesAnimation.value,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: kTextColor,
                fontFamily: 'Gilroy',
                fontSize: 13.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w300,
                height: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomePage.id);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kFloatingButton,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Center(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: kMainColor,
                    fontFamily: 'Gilroy',
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Not a member ?',
                style: TextStyle(
                  color: kTextColor,
                  fontFamily: 'Gilroy',
                  fontSize: 13.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 4.0),
              GestureDetector(
                child: Text(
                  'Join now',
                  style: TextStyle(
                    color: kFloatingButton,
                    fontFamily: 'Gilroy',
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

