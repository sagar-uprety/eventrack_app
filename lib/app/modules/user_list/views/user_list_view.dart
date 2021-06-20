import 'package:eventrack_app/app/modules/user_list/views/user_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  final UserListController userListController = Get.find<UserListController>();
  List <String> values = ['Shreya', 'Rose', 'Alex'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserListView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userListController.users.length,
        itemBuilder: (context, index){
          final item = values[index];
          return Dismissible(
            key: Key(item), 
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: UserListCard(username: '${userListController.users[index].username}'),
            ),
             background: Container(
               child: Row(
                 children: [
                   Icon(Icons.delete),
                   Text("Delete")
                 ],
               ),
               color: Colors.red
              ),
              secondaryBackground: Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Icon(Icons.delete),
                   Text("Delete")
                 ],
               ),
               
               color: Colors.red
              ),
              confirmDismiss: (direction) async {
          return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to delete ?"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // TODO: Delete the item from DB etc..
                  Navigator.of(context).pop();
                  print("item deleted");
                },
              ),
            ],
          );
        });
  } 
          );
        },
        
        )
      );

  }
}
