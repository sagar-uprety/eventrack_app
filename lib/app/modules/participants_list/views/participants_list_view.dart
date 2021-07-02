import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/tiles/participantCard.dart';
import '../controllers/participants_list_controller.dart';

class ParticipantsListView extends GetView<ParticipantsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Explore users',
        addBackButton: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: controller.users.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return ParticipantCard(controller.users[index]);
            },
          ).paddingOnly(top: 70, bottom: 15),
          Form(
            child: FormInputField(
              label: 'Search',
              controller: controller.searchText,
              suffixIcon: Icons.search,
              onClickedSuffix: controller.search,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';

// import '../../../global_widgets/appBar.dart';
// import '../../../global_widgets/dialog_box.dart';
// import '../../../utilities/colors.dart';
// import '../controllers/participants_list_controller.dart';
// import 'participants_list_cards.dart';

// class ParticipantsListView extends GetView<ParticipantsListController> {
//   final ParticipantsListController listcontroller =
//       Get.find<ParticipantsListController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: ETAppBar(
//           addBackButton: true,
//           title: 'Participants',
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () => print('Search Icon Pressed'),
//             ),
//           ],
//         ),
//         body: ListView.builder(
//             padding: EdgeInsets.all(0),
//             itemCount: listcontroller.users.length,
//             itemBuilder: (context, index) {
//               final item = listcontroller.users[index].toString();
//               return Container(
//                 height: 80,
//                 child: Slidable(
//                   key: Key(item),
//                   actionExtentRatio: 0.2,
//                   actionPane: SlidableScrollActionPane(),
//                   secondaryActions: [
//                     IconSlideAction(
//                       color: AppColors.background,
//                       iconWidget: Icon(
//                         Icons.delete,
//                         color: Colors.orange,
//                       ),
//                       caption: 'Remove',
//                       onTap: () async {
//                         print('archive');
//                         return showDialog(
//                           context: context,
//                           builder: (_) => ETDialog(
//                             'Do you want delete this user?',
//                             type: AlertType.Warning,
//                             onProceed: () => print('Proceed'),
//                           ),
//                         );
//                       },
//                     ),
//                     IconSlideAction(
//                       color: AppColors.background,
//                       iconWidget: Icon(
//                         Icons.clear_rounded,
//                         color: Colors.grey,
//                       ),
//                       caption: 'Cancel',
//                       onTap: () {
//                         Get.back();
//                       },
//                     )
//                   ],
//                   child: ListTile(
//                     contentPadding: EdgeInsets.all(0),
//                     title: ParticipantsListCard(
//                       username: listcontroller.users[index].name,
//                       profileImage: listcontroller.users[index].profileImage,
//                       address: listcontroller.users[index].address,
//                       email: listcontroller.users[index].email,
//                     ),
//                   ),
//                   dismissal: SlidableDismissal(
//                     child: SlidableDrawerDismissal(),
//                     onDismissed: (actiontype) {
//                       print('deleted');
//                     },
//                   ),
//                 ),
//               );
//             }));
//   }
// }
