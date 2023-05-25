// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default(0) int id,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class UserList with _$UserList {
  const factory UserList({
    @Default([]) List<User> userList,
  }) = _UserList;
  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
}
