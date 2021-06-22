import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentTextStyle:Theme.of(context).textTheme.bodyText1,
      actionsPadding: EdgeInsets.only(right: 10),
      contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
      title: Center(
        child: Column(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: Colors.red,
              size: 30,
            ),
                SizedBox(
                  height: 10,
             ),
            Text("Delete User?"),
          ],
        )
      ),
      content: Text(
          "Please confirm to delete user",
          style: TextStyle(
            fontSize: 14
          ),
        ),
      actions: <Widget>[
        MaterialButton(
          color:Color(0xFFDDDDDD),
          child: Text(
            "Cancel",
            style:Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        MaterialButton(
          color:Color(0xFFd99595),
          child: Text(
            "Delete",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Get.back();
            print("item deleted");
          },
        ),
      ],
    );
  }
}
