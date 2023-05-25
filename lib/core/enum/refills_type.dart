import 'package:pine_app/feature/app.dart';
import 'package:pine_app/generated/l10n.dart';

enum RefillsType { translations, paymentOfContracts }

extension RefillsTypeExtension on RefillsType {
  String get displayName {
    if (this == RefillsType.translations) {
      return S.current.translations;
    }
    if (this == RefillsType.paymentOfContracts) {
      return S.current.paymentOfContracts;
    }

    return '';
  }
}

RefillsType? fromStringToRefillsType(String status) {
  return RefillsType.values
      .firstWhereOrNull((element) => element.name == status);
}
