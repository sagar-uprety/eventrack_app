import 'package:flutter/material.dart';

class ParticipantsListCard extends StatelessWidget {
  const ParticipantsListCard({
    @required this.username,
    @required this.email,
    @required this.address,
    @required this.profileImage,
    Key? key,
  }) : super(key: key);

  final String? username;
  final String? email;
  final String? address;
  final String? profileImage;
  

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    return Container(
      padding: EdgeInsets.all(10),
      width: hrwidth,
      height: 85,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              profileImage!,
            ),
            radius: 30,
          ),
           SizedBox(
            width: hrwidth*0.0416,
          ), 
          Container(
            alignment: Alignment.centerLeft,
            width: hrwidth*0.68,
            child: FittedBox(
              child: Container(
                width: hrwidth*0.68,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$username',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        width: hrwidth*0.68,
                        child: Text(
                          '$email',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            color: Colors.grey
                          )
                        ),
                      ),
                    ),
                    Text(
                      '$address',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: Colors.grey
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: hrwidth*0.005,
          ),
          Icon(
            Icons.check_circle_rounded,
            color: Colors.deepOrangeAccent,
            size: 18,
          )
        ],
      ),
      color: Colors.white,
    );
  }
}
