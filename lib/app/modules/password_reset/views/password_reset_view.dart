import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  final PasswordResetController passwordController = Get.find<PasswordResetController>();
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
              Get.back();
            },
          ),
          title: Text('Reset Your Password'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: hrheight*0.008, horizontal: hrwidth*0.042),
          child: SingleChildScrollView(
            child: Obx(()=> Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/reset-password-icon.jpg',
                      width: 60,
                    ),
                  ),
                  Container(
                    width: hrwidth,
                    child: Wrap(
                      children: [
                        Text(
                          "Choose strong password and the one you haven't used in other accounts",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: true,
                    autofocus: false,
                    obscureText: passwordController.obscureNewPassword.value,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        color: DarkColors.lightGrey
                      ),
                      suffixIcon:IconButton(
                        icon: Icon( !passwordController.obscureNewPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                        color:  Colors.purple,
                        ),
                        onPressed: () {
                          passwordController.obscureNewPassword.value = !passwordController.obscureNewPassword.value;
                        },
                        ),
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey
                            )
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width:2,
                              color: Colors.grey,
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            )
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          color: Colors.black
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Re-type Password',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: true,
                    autofocus: false,
                    obscureText: passwordController.obscureRetyped.value,
                    decoration: InputDecoration(
                      suffixIcon:IconButton(
                        icon: Icon( !passwordController.obscureRetyped.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                        color:  Colors.purple,
                        ),
                        onPressed: () {
                          passwordController.obscureRetyped.value = !passwordController.obscureRetyped.value;
                        },
                        ),
                        hintText: "Enter password",
                        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 18,
                          color: DarkColors.lightGrey
                        ),
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey
                            )
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            )
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          color: Colors.black
                        ),
                  ),
                    ],
                  ).paddingSymmetric(horizontal: 10, vertical: 15),
                  
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                        color: AppColors.dark80,
                        onPressed: ()  {
                          print('Changed');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),                            
                      ),
                      MaterialButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Get.back();
                        },
                        color: AppColors.dark25,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
