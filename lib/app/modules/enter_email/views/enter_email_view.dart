import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/enter_email_controller.dart';

class EnterEmailView extends GetView<EnterEmailController> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: (){
              Get.back();
            },
          ),
        title: Text('Verification'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: hrheight*0.063, horizontal: hrwidth*0.042),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: hrheight*0.042),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/mail.jpg',),
                    radius: 50,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: hrwidth*0.042),
                    width: hrwidth,
                child: Text(
                      'Enter the email address associated with your account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20
                      ),
                    ),
                    
              ),
              SizedBox(
                    height: 20,
                  ),
               Text(
                      'We will sent you verification code to reset your password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                     textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
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
              MaterialButton(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                              ),
                              color: AppColors.dark80,
                              onPressed: ()  {
                                Get.toNamed(Routes.TOKEN_VERIFCATION);
                                print('Changed');
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),                            
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
