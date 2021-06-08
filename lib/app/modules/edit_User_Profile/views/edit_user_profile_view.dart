import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileView extends GetView<EditUserProfileController> {
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
                          ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                              height: hrheight*0.145,
                              width: hrwidth*0.24,
                              child: Image.network(
                                "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
                                height:hrheight*0.145,
                                width: hrwidth*0.24,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -5,
                            right: -14,
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
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                     ),  
                    // Text(
                    //   'UserProfileView is working',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    // Text("$hrwidth"),
                    
                  ],
                ),
              ),
              TextField1(),
              // TextFieldWidget(),
              // CupertinoTextField(
              //   placeholder: "Shreya Shrestha",
              //   controller: TextEditingController(text: "Shreya Shrestha", ),
              // ),
      //         Text(
      //               "Your Name",
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold
      //               ),
      //             ),
      //              GestureDetector(
      //   onTap: (){
      //     FocusScopeNode currentFocus = FocusScope.of(context);
    
      //     if (!currentFocus.hasPrimaryFocus) {
      //       currentFocus.unfocus();
      //     }
      //   },
        // child: TextField1(),
      // ),
      //         UserProfileCard(hrwidth: hrwidth, title: "Name", value: "Rose Watson",),
      //         UserProfileCard(hrwidth: hrwidth, title: "Email", value: "someone@example.com",),
      //         UserProfileCard(hrwidth: hrwidth, title: "Username", value: "rosewat34",),
      //         UserProfileCard(hrwidth: hrwidth, title: "Phone number", value: "+977 9873567245"),
      //         UserProfileCard(hrwidth: hrwidth, title: "Address", value: "Kathmandu",),
      //         UserProfileCard(hrwidth: hrwidth, title: "Gender", value: "Female",),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: TextEditingController.fromValue(TextEditingValue(text: "Shreya Shrestha", selection: TextSelection.collapsed(offset: "Shreya Shrestha".length))),
              textAlign: TextAlign.center,
              autofocus: false,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFB1BFDB), width: 1.5),
                ),
                contentPadding: EdgeInsets.all(20.0),
                labelText: 'Task',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFB1BFDB),
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              style: TextStyle(
                fontSize: 20,
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
                   style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
  }
}
