import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade700),
            accountName: Text(
              "Nista Simkhada",
            ),
            accountEmail: Text(
              "simkhadanista99@gmail.com",
            ),
            currentAccountPicture: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage("assets/images/3.jpeg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
