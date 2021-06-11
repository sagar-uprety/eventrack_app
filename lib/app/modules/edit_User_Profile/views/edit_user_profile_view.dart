import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileView extends GetView<EditUserProfileController>  {
  final EditUserProfileController editController = Get.put(EditUserProfileController());
  void hideKeyboard(BuildContext context) {
        FocusScope.of(context).requestFocus(FocusNode());
      } 
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
                                "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
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
              EditUserTextField(hrwidth: hrwidth, title: "Name", value: "Rose Watson",icon: Icon(Icons.person),),
              EditUserTextField(hrwidth: hrwidth, title: "Email", value: "someone@example.com", icon: Icon(Icons.email),),
              EditUserTextField(hrwidth: hrwidth, title: "Username", value: "rosewat34",icon: Icon(Icons.account_circle),),
              EditUserTextField(hrwidth: hrwidth, title: "Phone number", value: "+977 9873567245", icon: Icon(Icons.phone),),
              EditUserTextField(hrwidth: hrwidth, title: "Address", value: "Kathmandu",icon: Icon(Icons.location_on),),
              EditUserTextField(hrwidth: hrwidth, title: "Gender", value: "Female",icon: Icon(Icons.person),),
            ],
          ),
        ),
      ),
    );
  }
}

class EditUserTextField extends StatelessWidget {
 
  const EditUserTextField({
    Key? key,
    required this.hrwidth,
    required this.title,
    required this.value,
    required this.icon
  }) : super(key: key);

  final double hrwidth;
  final String title;
  final String value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 0),
       padding: EdgeInsets.all(10),
       width: hrwidth,
       height: 74,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.all(0),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: TextEditingController.fromValue(TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length))),
              textAlign: TextAlign.start,
              enabled: true,
              enableInteractiveSelection: true,
              autofocus: false,
              decoration: InputDecoration(
                suffixIcon: icon,
                labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.only(bottom: 12),
                  fillColor: Color(0xff1a1a1a).withOpacity(0.88),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.white
                    )
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.white,
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.white,
                    )
                  ),
                ),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16
                ),
            )
          ),
        ],
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    Key? key,
    required this.hrwidth,
    required this.title,
    required this.value
  }) : super(key: key);

  final double hrwidth;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          );
  }
}
