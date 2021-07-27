import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/formField.dart';
import '../../../../global_widgets/tiles/participantCard.dart';
import '../../controllers/event_detail_controller.dart';

class EventDetailTab2 extends GetView<EventDetailController> {
  const EventDetailTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.partcipantList.length,
          itemBuilder: (_, index) {
            return ParticipantCard(controller.partcipantList[index]);
          },
        ),
        // Form(
        //   child: FormInputField(
        //     label: 'Search',
        //     controller: controller.searchText,
        //     suffixIcon: Icons.search,
        //     onClickedSuffix: controller.search,
        //   ),
        // ),
      ],
    );
  }
}
