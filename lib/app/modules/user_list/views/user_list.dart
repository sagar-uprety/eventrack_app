import 'package:flutter/material.dart';

class UserListCard extends StatelessWidget {
  const UserListCard({ 
    Key? key, 
    @required this.username
  }) : super(key: key);
  final String? username;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username!),
          Text('someone@email.com')
        ],
      ),
    );
  }
}