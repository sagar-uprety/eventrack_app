import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../models/overviewItemModel.dart';

class AdminDashboardController extends GetxController {
  get user => _user;
  get event => _event;
  get organization => _organization;

  //TODO: Update this lists with Database.

  List<OverviewItemModel> _user = [
    OverviewItemModel(title: 'Total', count: 72, color: AppColors.blue),
    OverviewItemModel(title: 'Verified', count: 63, color: AppColors.green),
    OverviewItemModel(title: 'Blocked', count: 3, color: AppColors.red),
    OverviewItemModel(title: 'Unverified', count: 9, color: AppColors.yellow),
  ];

  List<OverviewItemModel> _event = [
    OverviewItemModel(title: 'Total', count: 109, color: AppColors.blue),
    OverviewItemModel(title: 'Upcoming', count: 52, color: AppColors.green),
    OverviewItemModel(title: 'Past', count: 57, color: AppColors.yellow),
  ];

  List<OverviewItemModel> _organization = [
    OverviewItemModel(title: 'Total', count: 29, color: AppColors.blue),
    OverviewItemModel(title: 'Verified', count: 27, color: AppColors.green),
    OverviewItemModel(title: 'Blocked', count: 1, color: AppColors.red),
    OverviewItemModel(title: 'Pending', count: 2, color: AppColors.yellow),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
