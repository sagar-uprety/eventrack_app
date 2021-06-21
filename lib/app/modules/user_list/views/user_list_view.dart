import 'package:eventrack_app/app/modules/user_list/views/components/dialog.dart';
import 'package:eventrack_app/app/modules/user_list/views/user_list.dart';
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
          return Dismissible(
            key: Key(item), 
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: UserListCard(
                username: '${userListController.users[index].username}',
                email: '${userListController.users[index].email}',
                profileImage: '${userListController.users[index].profileImage}',
              ),
            ),
             background: Container(
              height: 50,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete),
                  Text(
                    "Delete",
                  )
                ],
              ),
            ),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteDialog();
                  }
            );
          } 
          );
        },
        
        )
      );

  }
}



