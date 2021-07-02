import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'user_list.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable()
class UserList {
  UserList(this.userList);

  //this key is taken from our response in server.
  @JsonKey(name: "user_list")
  List<User> userList;

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
