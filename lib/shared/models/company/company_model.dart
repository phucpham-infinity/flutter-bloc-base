// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    @Default("") String id,
    @Default("") String name,
    @Default("") String address,
    @Default("") String city,
    @Default("") String state,
    @Default("") String country,
    @Default("") @JsonKey(name: 'postal_code') String postalCode,
    @Default("") String phone,
    @Default("") String email,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
abstract class CompanyList with _$CompanyList {
  const factory CompanyList({
    @Default([]) List<Company> companyList,
  }) = _CompanyList;
  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);
}
