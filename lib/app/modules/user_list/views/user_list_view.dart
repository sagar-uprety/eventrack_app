import 'package:eventrack_app/app/modules/user_list/views/components/dialog.dart';
import 'package:eventrack_app/app/modules/user_list/views/user_list.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  final UserListController userListController = Get.find<UserListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         leading: BackButton(
          onPressed: (){
            print("Back");
          },
        ),
        title: Text('Users'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              print('search');
            }, 
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userListController.users.length,
        itemBuilder: (context, index){
          final item = userListController.users[index].toString();
          return Slidable(
            actionPane: SlidableScrollActionPane(),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: UserListCard(
                username: '${userListController.users[index].username}',
                email: '${userListController.users[index].email}',
                profileImage: '${userListController.users[index].profileImage}',
              ),
            ),
            key: Key(item),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                color: AppColors.background,
                iconWidget: Icon(
                  Icons.more_horiz,
                ),
                caption: "More",
                onTap: () async{
                  print('archive');
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MoreMenu();
                    }
                  );
                },
              ),
              IconSlideAction(
                color: AppColors.background,
                iconWidget: Icon(
                  Icons.close_rounded,
                  size: 26,
                ),
                caption: "Cancel",
                onTap: () async{
                 Get.back();
                },
              ),
            ],
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(
              ),
              onDismissed: (actiontype){
                print('deleted');
              },
            ),
          );
        },
        
        )
      );

  }
}



