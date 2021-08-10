import '../../../models/response.dart';

abstract class UserDashboardProvider {
  Future<ResponseModel?> getMyFavouriteEvents();
  Future<ResponseModel?> getMyEvents();
}
