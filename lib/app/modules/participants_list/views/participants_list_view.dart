import 'package:eventrack_app/app/global_widgets/dialogue_box.dart';
import 'package:eventrack_app/app/modules/participants_list/views/participants_list_cards.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';


import '../controllers/participants_list_controller.dart';

class ParticipantsListView extends GetView<ParticipantsListController> {
  final ParticipantsListController listcontroller = Get.find<ParticipantsListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            print('Back');
          },
        ),
        actions: [
          IconButton(
            onPressed: (){
              print('Search');
            }, 
            icon: Icon(
              Icons.search,
            )
          )
        ],
        title: Text('Participants List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: listcontroller.users.length,
        itemBuilder: (context,index){
          final item = listcontroller.users[index].toString();
          return Container(
            height: 80,
            child: Slidable(
              key: Key(item),
              actionExtentRatio: 0.2,
              actionPane: SlidableScrollActionPane(),
              secondaryActions: [
                 IconSlideAction(
                  color: AppColors.background,
                  iconWidget: Icon(Icons.delete, color: Colors.orange,),
                  caption: 'Remove',
                  onTap: () async{
                    print('archive');
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return deleteDialog(context);
                      }
                    );
                  },
                ),
                IconSlideAction(
                   color: AppColors.background,
                  iconWidget: Icon(Icons.clear_rounded,color: Colors.grey,),
                  caption: 'Cancel',
                  onTap: (){
                    Get.back();
                  },
                )
              ],
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: ParticipantsListCard(
                  username: listcontroller.users[index].username,
                  profileImage: listcontroller.users[index].profileImage,
                  address: listcontroller.users[index].address,
                  email: listcontroller.users[index].email,
                ),
              ),
               dismissal: SlidableDismissal(
                child: SlidableDrawerDismissal(
                ),
                onDismissed: (actiontype){
                  print('deleted');
                },
              ),
            ),
          );
        }
      )
    );
  }
}

