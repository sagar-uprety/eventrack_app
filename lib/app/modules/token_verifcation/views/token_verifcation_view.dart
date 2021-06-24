import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/token_verifcation_controller.dart';

class TokenVerifcationView extends GetView<TokenVerifcationController> {
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
          title: Text('Verifcation'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: hrheight*0.063, horizontal: hrwidth*0.042),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: hrheight*0.042),
                  child: Image.asset(
                    'assets/icons/verificationotp.png',
                    height: 60,
                  ),
                ),
                Text(
                  'Enter the verification number',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                 TextFormField(
                        keyboardType: TextInputType.number,
                        enabled: true,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Enter verification code",
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
                              Get.toNamed(Routes.PASSWORD_RESET);
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
      ),
    );
  }
}
