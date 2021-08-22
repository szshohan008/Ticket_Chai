import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:ticket_chai/Constants/ColorConstants.dart';
import 'package:ticket_chai/view/WelcomeScreen/utils/AccessOption.dart';

@framyWidget
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation _logoAnimation;
  Animation _inputAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 8));

    _logoAnimation = Tween(begin: 50.0, end: 150.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.40, curve: Curves.easeOut)));

    _inputAnimation = Tween(begin: 90.0, end: 75.0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.40, 0.60, curve: Curves.easeOut)));

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final Widget svgLogo = Image.asset('assets/logo/TicketChai.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: MediaQuery.of(context).size.height * 0.12,
          ),
          child: Column(
            children: [
              Container(
                height: _logoAnimation.value,
                child: Center(
                  child: svgLogo,
                ),
              ),
              customTextfield(
                  labelName: 'E-MAIL', labelIcon: Entypo.email, keybordtype: TextInputType.emailAddress, obscure: false),
              customTextfield(
                  labelName: 'PASSWORD', labelIcon: SimpleLineIcons.lock, keybordtype: TextInputType.text, obscure: true),
              AccessOption(),
            ],
          ),
        ),
      ),
    );
  }

  bool typeIn = false;

  Widget customTextfield(
      {@required String labelName, @required IconData labelIcon, @required TextInputType keybordtype, @required bool obscure}) {
    return Container(
      height: _inputAnimation.value,
      padding: EdgeInsets.only(bottom: 10.0),
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
                  size: 18.0,
                ),
              ),
              SizedBox(width: 6.0),
              Container(width: 0.5, height: 45.0, color: typeIn == true ? kFloatingButton : kTextColor),
              SizedBox(width: 14.0),
              Expanded(
                child: TextFormField(
                  keyboardType: keybordtype,
                  textCapitalization: TextCapitalization.none,
                  obscureText: obscure,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kFloatingButton,
                  ),
                  onTap: () => typeIn = true,
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
          Container(
              width: MediaQuery.of(context).size.width * 2.1, height: 0.5, color: typeIn == true ? kFloatingButton : kTextColor),
        ],
      ),
    );
  }
}
