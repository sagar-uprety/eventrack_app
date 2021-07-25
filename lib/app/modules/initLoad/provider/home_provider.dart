import '../../../models/response.dart';

abstract class HomeProvider {
  Future<ResponseModel?> getCurrentUser();
}
