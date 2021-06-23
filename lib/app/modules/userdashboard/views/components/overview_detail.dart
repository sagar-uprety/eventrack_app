import 'package:flutter/material.dart';

class OverviewDetail extends StatelessWidget {
  OverviewDetail({@required this.info, required this.eventsattended});

  final dynamic info;
  final String eventsattended;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$info',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$eventsattended',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
