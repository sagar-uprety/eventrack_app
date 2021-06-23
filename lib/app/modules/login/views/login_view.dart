import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../controllers/login_controller.dart';
import 'components/buttons.dart';

class LoginView extends GetView<LoginController> {
  final loginController =
      Get.find<LoginController>(); //or we can simply use controller
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Log in',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 30, fontWeight: FontWeight.bold, height: 1.5),
        ),
        titleSpacing: 10.00,
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, height: 1.5),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                controller: loginController.emailController,
                validator: (value) {
                  loginController.emailValidator(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    size: 21,
                  ),
                  fillColor: AppColors.background,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purple, width: 1.5),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  labelText: 'nistasimkhada@gmail.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Password',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, height: 1.5),
              ),
              SizedBox(
                height: 6.0,
                // height: 6.0,
              ),
              TextFormField(
                controller: loginController.passwordController,
                validator: (value) {
                  loginController.passwordValidator(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password_sharp,
                    size: 25,
                  ),
                  fillColor: AppColors.background,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purple, width: 1.5),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 60.0,
              ),
              Button(
                text: 'Create Account',
                press: loginController.onPressedlogin,
              ),
              SizedBox(
                height: 40.0,
              ),
              Button(
                press: loginController.onPressedlogin,
                text: 'Forget Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
