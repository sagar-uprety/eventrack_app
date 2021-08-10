import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../controllers/user_profile_controller.dart';
import 'user_profile_card.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrheight = queryData.size.height;
    return Scaffold(
      appBar: ETAppBar(
        title: 'Profile',
        addBackButton: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 95,
                        width: 95,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: AppColors.imageGradient(),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      controller.currentUser.profileImage!),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: -10,
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: FloatingActionButton(
                                  elevation: 0.0,
                                  backgroundColor: Color(0xFFC4D5EE),
                                  child: Icon(
                                    Icons.edit_rounded,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  onPressed: controller.pickProfile,
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                UserProfileCard(
                  title: "Name",
                  value: controller.currentUser.name!,
                ),
                UserProfileCard(
                  title: "Email",
                  value: controller.currentUser.email!,
                ),
                (controller.currentUser.phone != null)
                    ? UserProfileCard(
                        title: "Phone number",
                        value: controller.currentUser.phone!)
                    : UserProfileCard(title: "Phone number", value: "UNKNOWN"),
                (controller.currentUser.address != null)
                    ? UserProfileCard(
                        title: "Address",
                        value: controller.currentUser.address!,
                      )
                    : UserProfileCard(
                        title: "Address",
                        value: "UNKNOWN",
                      ),
                (controller.currentUser.gender != null)
                    ? UserProfileCard(
                        title: "Gender",
                        value: controller.currentUser.gender!,
                      )
                    : UserProfileCard(
                        title: "Gender",
                        value: "UNKNOWN",
                      ),
                SizedBox(
                  height: hrheight * 0.05,
                ),
                ETElevatedButton(
                  childText: 'Edit Profile',
                  onPressed: () {
                    Get.toNamed(Routes.EDIT_USER_PROFILE);
                  },
                ).paddingOnly(top: 24, left: 220),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
