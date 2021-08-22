import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../view/Home/utils/customDrawer.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: menu(context),
        onTap: () => CustomDrawer.of(context).open(),
      ),
    );
  }

  Widget menu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.004,
              width: MediaQuery.of(context).size.width * 0.04,
              color: Colors.black),
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.004,
          width: MediaQuery.of(context).size.width * 0.08,
          color: Colors.black,
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.004,
          width: MediaQuery.of(context).size.width * 0.04,
          color: Colors.black,
        ),
      ],
    );
  }
}

// Use material keybord Arrow up.
