import 'package:eventrack_app/app/global_widgets/app_drawer.dart';
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
        drawer: buildAppDrawer(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
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
                SizedBox(height: 14),
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
                ),
                OutlinedButton(
                  onPressed: signupController.onPressedsignUp,
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ));
  }
}
