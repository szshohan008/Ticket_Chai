import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment via',
            style: TextStyle(
              fontFamily: 'Gilroy',
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
              height: 1.5,
            ),
          ),
        ],
      ),
    );

  }
}
