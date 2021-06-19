import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            print("Back");
          },
        ),
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                   SizedBox(
                    height: 95,
                    width: 95,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
                            ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: -10,
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              elevation: 0.0,
                              backgroundColor: Color(0xFFC4D5EE),
                              child: Icon(
                                Icons.edit_rounded,
                                color: Colors.blue,
                                size: 20,
                              ),
                              onPressed: (){
                                Get.toNamed(Routes.EDIT_USER_PROFILE);
                              },
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 3,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   ),  
                ],
              ),
            ),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Name", value: "Rose Watson",),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Email", value: "someone@example.com",),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Username", value: "rosewat34",),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Phone number", value: "+977 9873567245"),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Address", value: "Kathmandu",),
            UserProfileCard(hrwidth: hrwidth, hrheight: hrheight, title: "Gender", value: "Female",),
            SizedBox(
                height: hrheight*0.05,
              )
          ],
        ),
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    Key? key,
    required this.hrwidth,
    required this.hrheight,
    required this.title,
    required this.value
  }) : super(key: key);

  final double hrwidth;
  final double hrheight;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
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
