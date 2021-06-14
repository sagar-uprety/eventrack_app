import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 20, right: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 16, height: 1.5),
          ),
          SizedBox(
            height: 6.0,
          ),
          TextFormField(
            validator: (value) {
              if (value!.length < 4)
                return "Donot leave it empty";
              else
                return null;
            },
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 25,
              ),
              fillColor: AppColors.background,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
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
              labelText: 'Name',
            ),
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 20.0,
          ),
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
          ),
          TextFormField(
            validator: (value) {
              if (value!.length < 8)
                return "Donot leave it empty";
              else
                return null;
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
          Buttons(),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.purple,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 110.0),
            child: Text(
              'Forget Password',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16, height: 1.5),
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.purple,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 110.0),
            child: Text(
              'Create Account',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16, height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
