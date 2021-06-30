import 'package:eventrack_app/app/models/response.dart';

import '../../../models/user/user.dart';

//TODO: searchEvents and FilterEvents
abstract class SignUpProvider {
  Future<ResponseModel?> registerUser({Map<String, dynamic> data});
}
