import 'package:flutter/material.dart';

class UserListCard extends StatelessWidget {
  const UserListCard({ 
    Key? key, 
    @required this.username,
    @required this.email,
    @required this.profileImage,
  }) : super(key: key);
  final String? username;
  final String? email;
  final String? profileImage;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    return Container(
      width: hrwidth,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(top:5, right: 10, left: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                profileImage!
              ),
          ),
          SizedBox(
            width: hrwidth*0.0416,
          ),
          FittedBox(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 17
                    ),
                  ),
                  SizedBox(
                    height:5,
                  ),
                  FittedBox(
                    child: Container(
                      width: hrwidth*0.680,
                      child: Text(
                        email!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}