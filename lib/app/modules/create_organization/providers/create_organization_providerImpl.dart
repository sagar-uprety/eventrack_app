import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'create_organization_provider.dart';

class CreateOrganizationProviderImpl implements CreateOrganizationProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  CreateOrganizationProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> createOrganization(Map<String, dynamic> data) async {
    try {
      final ResponseModel? response =
          await _httpService.postRequest('/org/', data: data);
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
