import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/tiles/participantCard.dart';
import '../../controllers/event_detail_controller.dart';

class EventDetailTab2 extends GetView<EventDetailController> {
  const EventDetailTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          "Participants List",
          style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
        ).paddingOnly(left: 24, top: 10),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.partcipantList.length,
            itemBuilder: (_, index) {
              return ParticipantCard(controller.partcipantList[index]);
            },
          ),
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
