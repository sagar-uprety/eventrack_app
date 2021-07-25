import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/button.dart';
import '../../controllers/organization_profile_controller.dart';

class OrganizationProfileTab1 extends GetView<OrganizationProfileController> {
  OrganizationProfileTab1({Key? key}) : super(key: key);

  final description =
      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.\nLorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.\nVersions of the Lorem ipsum text have been used in typesetting at least since the 1960s, when it was popularized by advertisements for Letraset transfer sheets.[1] Lorem ipsum was introduced to the digital world in the mid-1980s, when Aldus employed it in graphic and word-processing templates for its desktop publishing program PageMaker. Other popular word processors, including Pages and Microsoft Word, have since adopted Lorem ipsum,[2] as have many LaTeX packages, web content managers such as Joomla! and WordPress, and CSS libraries such as Semantic UI.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            'EventTrack', //? Organization Name
            style:
                Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
          ),
          subtitle: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://i0.wp.com/redanianintelligence.com/wp-content/uploads/2020/09/1307234_jasonmomoa_857342.jpg?fit=1084%2C722&ssl=1', //? Organization's creator profile image
              ),
            ),
            title: Text(
              'Jason Mark', //? Organization's creator name
              style: Get.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ).paddingOnly(top: 4),
        ).paddingSymmetric(vertical: 8),
        Text(
          'About',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
        ).paddingOnly(top: 12),
        Obx(
          () => Text(
            '$description', //? Organization's description
            maxLines: !controller.showMore.value ? 12 : null,
            style: Get.textTheme.bodyText1,
          ),
        ),
        Obx(
          () => ETTextButton(
            !controller.showMore.value ? 'Show More' : 'Show Less',
            onPressed: controller.toggleDescriptionDisplay,
          ),
        ),
        Center(
          child: ETElevatedButton(
            onPressed: () {},
            childText: 'Create Organization',
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
