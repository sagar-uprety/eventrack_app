import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    Key? key,
    required this.title,
    required this.value
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: hrheight*0.008, horizontal: hrwidth*0.042),
      padding: EdgeInsets.all(10),
      width: hrwidth,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white
          ),
        ),
      ),
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
  }
}