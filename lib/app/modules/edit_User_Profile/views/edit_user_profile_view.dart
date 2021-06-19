import 'package:eventrack_app/app/modules/edit_User_Profile/views/edit_textfield.dart';
import 'package:eventrack_app/app/modules/edit_User_Profile/views/select_gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileView extends GetView<EditUserProfileController>  {
  final EditUserProfileController editController = Get.put(EditUserProfileController());
    
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              print("Back");
               Get.back();
            },
          ),
          title: Text('Edit User Data'),
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
                                editController.user.profileImage
                              ),
                          ),
                          Positioned(
                            bottom: -5,
                            right: -10,
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor: Color(0xFFC4D5EE),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                onPressed: (){
                                  print("Change picture");
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
              EditUserTextField(title: "Name", value: editController.user.username,icon: Icon(Icons.person), editable: true,),
              EditUserTextField(title: "Email", value: editController.user.email, icon: Icon(Icons.email), editable: false),
              EditUserTextField(title: "Phone number", value: editController.user.phoneNo, icon: Icon(Icons.phone),editable: true),
              EditUserTextField(title: "Address", value: editController.user.address,icon: Icon(Icons.location_on),editable: true),
              Center(
                child: SelectGender()
              ),
              SizedBox(
                height: hrheight*0.01,
              ),
              Center(
                child: TextButton(
                  child: Text("Change Password"), 
                  onPressed: (){
                    print('PasswordChanged');
                  },),
              ),
              SizedBox(
                height: hrheight*0.01,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    print("Saved");
                  }, 
                  child: Text("Save")
                ),
              ),
              SizedBox(
                height: hrheight*0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}



