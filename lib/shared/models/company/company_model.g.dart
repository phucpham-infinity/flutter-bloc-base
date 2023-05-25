// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      address: json['address'] as String? ?? "",
      city: json['city'] as String? ?? "",
      state: json['state'] as String? ?? "",
      country: json['country'] as String? ?? "",
      postalCode: json['postal_code'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      email: json['email'] as String? ?? "",
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'email': instance.email,
    };

_$_CompanyList _$$_CompanyListFromJson(Map<String, dynamic> json) =>
    _$_CompanyList(
      companyList: (json['companyList'] as List<dynamic>?)
              ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CompanyListToJson(_$_CompanyList instance) =>
    <String, dynamic>{
      'companyList': instance.companyList,
    };
