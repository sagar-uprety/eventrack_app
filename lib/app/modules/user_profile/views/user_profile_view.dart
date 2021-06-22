import 'package:eventrack_app/app/modules/user_profile/views/user_profile_card.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserProfileController>();
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
      body: Center(
        child: SingleChildScrollView(
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
                              userController.user.profileImage
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
              UserProfileCard(title: "Name", value: userController.user.username,),
              UserProfileCard(title: "Email", value: userController.user.email,),
              UserProfileCard(title: "Phone number", value: userController.user.phoneNo),
              UserProfileCard(title: "Address", value: userController.user.address,),
              UserProfileCard(title: "Gender", value: userController.user.gender,),
              SizedBox(
                  height: hrheight*0.05,
                )
            ],
          ),
        ),
      ),
    );
  }
}
