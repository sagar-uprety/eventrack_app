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
              EditUserTextField(hrwidth: hrwidth, hrheight: hrheight, title: "Name", value: "Rose Watson",icon: Icon(Icons.person), editable: true,),
              EditUserTextField(hrwidth: hrwidth, hrheight: hrheight, title: "Email", value: "someone@example.com", icon: Icon(Icons.email), editable: false),
              EditUserTextField(hrwidth: hrwidth, hrheight: hrheight, title: "Username", value: "rosewat34",icon: Icon(Icons.account_circle),editable: true),
              EditUserTextField(hrwidth: hrwidth, hrheight: hrheight, title: "Phone number", value: "+977 9873567245", icon: Icon(Icons.phone),editable: true),
              EditUserTextField(hrwidth: hrwidth, hrheight: hrheight, title: "Address", value: "Kathmandu",icon: Icon(Icons.location_on),editable: true),
              Center(
                child: SelectGender(hrheight: hrheight, hrwidth: hrwidth,)
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

class SelectGender extends StatefulWidget {
  const SelectGender({
    required this.hrwidth,
    required this.hrheight,
    Key? key,
  }) : super(key: key);

  final double hrwidth;
  final double hrheight;

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  
  @override
  Widget build(BuildContext context) {
    Object? currentGender = "Female";
    List gender = [
    "Male",
    "Female"
  ];
    return Container(
      width: widget.hrwidth,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.hrwidth,
            margin: EdgeInsets.symmetric( horizontal: widget.hrwidth*0.042),
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
              margin: EdgeInsets.symmetric( horizontal: widget.hrwidth*0.042),
              // padding: EdgeInsets.only(right: 10),
              width: widget.hrwidth,
              height: 30,
              child: DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                      ),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(bottom: 12, right: 10),
                    fillColor: Color(0xff1a1a1a).withOpacity(0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white
                      )
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
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
                value: currentGender,
                items: gender
                   .map((gender) => DropdownMenuItem(
                    child: Text(gender.toString()),
                    value: gender,
                  )
                  ) .toList(),
               hint: Text("Gender"),
               onChanged: (value) {
                 setState(() {
                   currentGender = value;
                 });
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

class EditUserTextField extends StatelessWidget {
 
  const EditUserTextField({
    Key? key,
    required this.hrwidth,
    required this.hrheight,
    required this.title,
    required this.value,
    required this.icon,
    required this.editable
  }) : super(key: key);

  final double hrwidth;
  final double hrheight;
  final String title;
  final String value;
  final Widget icon;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: hrheight*0.008, horizontal: hrwidth*0.042),
       padding: EdgeInsets.all(10),
       width: hrwidth,
       height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              child: Text(
               title,
                style: (editable) ? Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold
                ):Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                              color: Color(0xff818181)
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.all(0),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: TextEditingController.fromValue(TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length))),
                textAlign: TextAlign.start,
                enabled: editable,
                enableInteractiveSelection: editable,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: icon,
                  labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(bottom: 20),
                    fillColor: Color(0xff1a1a1a).withOpacity(0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white
                      )
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
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
                  style: (editable) ? Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16
                  ): Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    color: Color(0xff818181)
                  )
              )
            ),
          ),
        ],
      ),
    );
  }
}
