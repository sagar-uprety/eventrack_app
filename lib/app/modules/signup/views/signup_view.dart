import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final signupController =
      Get.find<SignupController>(); //or we can simply use controller
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  controller: signupController.emailController,
                  validator: (value) {
                    signupController.emailValidator(value);
                  },
                  /*   onChanged: (_) {
                    print(signupController.emailController.value);
                  }, */
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  controller: signupController.passwordController,
                  validator: (value) {
                    return signupController.passwordValidator(value);
                  },
                ),
                ElevatedButton(
                  onPressed: signupController.onPressedsignUp,
                  child: Text("Register"),
                )
              ],
            ),
          ),
        ));
  }
}
