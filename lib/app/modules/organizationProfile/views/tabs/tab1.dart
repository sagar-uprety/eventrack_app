import 'package:eventrack_app/app/modules/organizationProfile/controllers/organization_profile_controller.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationProfileTab1 extends StatelessWidget {
  OrganizationProfileTab1({Key? key}) : super(key: key);

  final description =
      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.\nLorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.\nVersions of the Lorem ipsum text have been used in typesetting at least since the 1960s, when it was popularized by advertisements for Letraset transfer sheets.[1] Lorem ipsum was introduced to the digital world in the mid-1980s, when Aldus employed it in graphic and word-processing templates for its desktop publishing program PageMaker. Other popular word processors, including Pages and Microsoft Word, have since adopted Lorem ipsum,[2] as have many LaTeX packages, web content managers such as Joomla! and WordPress, and CSS libraries such as Semantic UI.";

  final controller = Get.find<OrganizationProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              'EventTrack',
              style: Get.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            subtitle: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                    'https://i0.wp.com/redanianintelligence.com/wp-content/uploads/2020/09/1307234_jasonmomoa_857342.jpg?fit=1084%2C722&ssl=1'),
              ),
              title: Text(
                'Jason Mark',
                style: Get.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ).paddingOnly(top: 4),
            trailing: IconButton(
              onPressed: () => print("bookmark"),
              icon: Icon(
                Icons.bookmark_border,
                size: 28,
                color: AppColors.dark50,
              ),
            ),
          ).paddingSymmetric(vertical: 8),
          Text(
            'About',
            style:
                Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
          ),
          Obx(
            () => Text(
              '$description',
              maxLines: !controller.showMore.value ? null : 12,
              style: Get.textTheme.bodyText1,
            ),
          ),
          Obx(
            () => TextButton(
              onPressed: controller.toggleDescriptionDisplay,
              child:
                  Text(!controller.showMore.value ? 'Show Less' : 'Show More'),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
