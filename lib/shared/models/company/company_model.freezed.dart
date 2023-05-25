// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String city,
      String state,
      String country,
      @JsonKey(name: 'postal_code') String postalCode,
      String phone,
      String email});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$_CompanyCopyWith(
          _$_Company value, $Res Function(_$_Company) then) =
      __$$_CompanyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String city,
      String state,
      String country,
      @JsonKey(name: 'postal_code') String postalCode,
      String phone,
      String email});
}

/// @nodoc
class __$$_CompanyCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$_Company>
    implements _$$_CompanyCopyWith<$Res> {
  __$$_CompanyCopyWithImpl(_$_Company _value, $Res Function(_$_Company) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$_Company(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Company implements _Company {
  const _$_Company(
      {this.id = "",
      this.name = "",
      this.address = "",
      this.city = "",
      this.state = "",
      this.country = "",
      @JsonKey(name: 'postal_code') this.postalCode = "",
      this.phone = "",
      this.email = ""});

  factory _$_Company.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'Company(id: $id, name: $name, address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Company &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, city, state,
      country, postalCode, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      __$$_CompanyCopyWithImpl<_$_Company>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  const factory _Company(
      {final String id,
      final String name,
      final String address,
      final String city,
      final String state,
      final String country,
      @JsonKey(name: 'postal_code') final String postalCode,
      final String phone,
      final String email}) = _$_Company;

  factory _Company.fromJson(Map<String, dynamic> json) = _$_Company.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get city;
  @override
  String get state;
  @override
  String get country;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      throw _privateConstructorUsedError;
}

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) {
  return _CompanyList.fromJson(json);
}

/// @nodoc
mixin _$CompanyList {
  List<Company> get companyList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyListCopyWith<CompanyList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyListCopyWith<$Res> {
  factory $CompanyListCopyWith(
          CompanyList value, $Res Function(CompanyList) then) =
      _$CompanyListCopyWithImpl<$Res, CompanyList>;
  @useResult
  $Res call({List<Company> companyList});
}

/// @nodoc
class _$CompanyListCopyWithImpl<$Res, $Val extends CompanyList>
    implements $CompanyListCopyWith<$Res> {
  _$CompanyListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyList = null,
  }) {
    return _then(_value.copyWith(
      companyList: null == companyList
          ? _value.companyList
          : companyList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyListCopyWith<$Res>
    implements $CompanyListCopyWith<$Res> {
  factory _$$_CompanyListCopyWith(
          _$_CompanyList value, $Res Function(_$_CompanyList) then) =
      __$$_CompanyListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Company> companyList});
}

/// @nodoc
class __$$_CompanyListCopyWithImpl<$Res>
    extends _$CompanyListCopyWithImpl<$Res, _$_CompanyList>
    implements _$$_CompanyListCopyWith<$Res> {
  __$$_CompanyListCopyWithImpl(
      _$_CompanyList _value, $Res Function(_$_CompanyList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyList = null,
  }) {
    return _then(_$_CompanyList(
      companyList: null == companyList
          ? _value._companyList
          : companyList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyList implements _CompanyList {
  const _$_CompanyList({final List<Company> companyList = const []})
      : _companyList = companyList;

  factory _$_CompanyList.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyListFromJson(json);

  final List<Company> _companyList;
  @override
  @JsonKey()
  List<Company> get companyList {
    if (_companyList is EqualUnmodifiableListView) return _companyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companyList);
  }

  @override
  String toString() {
    return 'CompanyList(companyList: $companyList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyList &&
            const DeepCollectionEquality()
                .equals(other._companyList, _companyList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_companyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyListCopyWith<_$_CompanyList> get copyWith =>
      __$$_CompanyListCopyWithImpl<_$_CompanyList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyListToJson(
      this,
    );
  }
}

abstract class _CompanyList implements CompanyList {
  const factory _CompanyList({final List<Company> companyList}) =
      _$_CompanyList;

  factory _CompanyList.fromJson(Map<String, dynamic> json) =
      _$_CompanyList.fromJson;

  @override
  List<Company> get companyList;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyListCopyWith<_$_CompanyList> get copyWith =>
      throw _privateConstructorUsedError;
}
