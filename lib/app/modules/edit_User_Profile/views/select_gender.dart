import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_user_profile_controller.dart';

class SelectGender extends GetView<EditUserProfileController> {
  const SelectGender({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {

    final editProfileController = Get.find<EditUserProfileController>();

    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return Container(
      width: hrwidth,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: hrwidth,
            margin: EdgeInsets.only(bottom: hrheight*0.008, top:hrheight*0.001 , right: hrwidth*0.042, left: hrwidth*0.042),
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Gender",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric( horizontal:hrwidth*0.042),
              width: hrwidth,
              height: 60,
              child: DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                      ),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    fillColor: Color(0xff1a1a1a).withOpacity(0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey
                      )
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )
                    ),
                ),
                value: editProfileController.currentGender,
                items: editProfileController.gender
                   .map((gender) => DropdownMenuItem(
                    child: Text(gender.toString()),
                    value: gender,
                  )
                  ) .toList(),
               hint: Text("Gender"),
               onChanged: (value) {
                 print(value);
               },
                ),
            ),
          ),
        ],
      ),
    );
  }
}